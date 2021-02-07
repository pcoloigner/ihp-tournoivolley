module Admin.Controller.TournoiPoules where

import Admin.Controller.Prelude
import Admin.View.TournoiPoules.Index
import Admin.View.TournoiPoules.New
import Admin.View.TournoiPoules.Edit
import Admin.View.TournoiPoules.Show

instance Controller TournoiPoulesController where
    action TournoiPoulesAction = do
        tournoiPoules <- query @TournoiPoule |> fetch
        render IndexView { .. }

    action NewTournoiPouleAction = do
        let tournoiPoule = newRecord
        render NewView { .. }

    action ShowTournoiPouleAction { tournoiPouleId } = do
        tournoiPoule <- fetch tournoiPouleId
        render ShowView { .. }

    action EditTournoiPouleAction { tournoiPouleId } = do
        tournoiPoule <- fetch tournoiPouleId
        render EditView { .. }

    action UpdateTournoiPouleAction { tournoiPouleId } = do
        tournoiPoule <- fetch tournoiPouleId
        tournoiPoule
            |> buildTournoiPoule
            |> ifValid \case
                Left tournoiPoule -> render EditView { .. }
                Right tournoiPoule -> do
                    tournoiPoule <- tournoiPoule |> updateRecord
                    setSuccessMessage "TournoiPoule updated"
                    redirectTo EditTournoiPouleAction { .. }

    action CreateTournoiPouleAction = do
        let tournoiPoule = newRecord @TournoiPoule
        tournoiPoule
            |> buildTournoiPoule
            |> ifValid \case
                Left tournoiPoule -> render NewView { .. } 
                Right tournoiPoule -> do
                    tournoiPoule <- tournoiPoule |> createRecord
                    setSuccessMessage "TournoiPoule created"
                    redirectTo TournoiPoulesAction

    action DeleteTournoiPouleAction { tournoiPouleId } = do
        tournoiPoule <- fetch tournoiPouleId
        deleteRecord tournoiPoule
        setSuccessMessage "TournoiPoule deleted"
        redirectTo TournoiPoulesAction

buildTournoiPoule tournoiPoule = tournoiPoule
    |> fill @["numero","libelle","nbEquipes","tournoiPhaseId","tournoiBrancheId"]
