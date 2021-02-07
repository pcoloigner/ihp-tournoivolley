module Admin.Controller.TournoiPhases where

import Admin.Controller.Prelude
import Admin.View.TournoiPhases.Index
import Admin.View.TournoiPhases.New
import Admin.View.TournoiPhases.Edit
import Admin.View.TournoiPhases.Show

instance Controller TournoiPhasesController where
    action TournoiPhasesAction = do
        tournoiPhases <- query @TournoiPhase |> fetch
        render IndexView { .. }

    action NewTournoiPhaseAction = do
        let tournoiPhase = newRecord
        render NewView { .. }

    action ShowTournoiPhaseAction { tournoiPhaseId } = do
        tournoiPhase <- fetch tournoiPhaseId
        render ShowView { .. }

    action EditTournoiPhaseAction { tournoiPhaseId } = do
        tournoiPhase <- fetch tournoiPhaseId
        render EditView { .. }

    action UpdateTournoiPhaseAction { tournoiPhaseId } = do
        tournoiPhase <- fetch tournoiPhaseId
        tournoiPhase
            |> buildTournoiPhase
            |> ifValid \case
                Left tournoiPhase -> render EditView { .. }
                Right tournoiPhase -> do
                    tournoiPhase <- tournoiPhase |> updateRecord
                    setSuccessMessage "TournoiPhase updated"
                    redirectTo EditTournoiPhaseAction { .. }

    action CreateTournoiPhaseAction = do
        let tournoiPhase = newRecord @TournoiPhase
        tournoiPhase
            |> buildTournoiPhase
            |> ifValid \case
                Left tournoiPhase -> render NewView { .. } 
                Right tournoiPhase -> do
                    tournoiPhase <- tournoiPhase |> createRecord
                    setSuccessMessage "TournoiPhase created"
                    redirectTo TournoiPhasesAction

    action DeleteTournoiPhaseAction { tournoiPhaseId } = do
        tournoiPhase <- fetch tournoiPhaseId
        deleteRecord tournoiPhase
        setSuccessMessage "TournoiPhase deleted"
        redirectTo TournoiPhasesAction

buildTournoiPhase tournoiPhase = tournoiPhase
    |> fill @["numero","libelle","tournoiId"]
