module Admin.Controller.TournoiBranches where

import Admin.Controller.Prelude
import Admin.View.TournoiBranches.Index
import Admin.View.TournoiBranches.New
import Admin.View.TournoiBranches.Edit
import Admin.View.TournoiBranches.Show

instance Controller TournoiBranchesController where
    action TournoiBranchesAction = do
        tournoiBranches <- query @TournoiBranch |> fetch
        render IndexView { .. }

    action NewTournoiBranchAction = do
        let tournoiBranch = newRecord
        render NewView { .. }

    action ShowTournoiBranchAction { tournoiBranchId } = do
        tournoiBranch <- fetch tournoiBranchId
        render ShowView { .. }

    action EditTournoiBranchAction { tournoiBranchId } = do
        tournoiBranch <- fetch tournoiBranchId
        render EditView { .. }

    action UpdateTournoiBranchAction { tournoiBranchId } = do
        tournoiBranch <- fetch tournoiBranchId
        tournoiBranch
            |> buildTournoiBranch
            |> ifValid \case
                Left tournoiBranch -> render EditView { .. }
                Right tournoiBranch -> do
                    tournoiBranch <- tournoiBranch |> updateRecord
                    setSuccessMessage "TournoiBranch updated"
                    redirectTo EditTournoiBranchAction { .. }

    action CreateTournoiBranchAction = do
        let tournoiBranch = newRecord @TournoiBranch
        tournoiBranch
            |> buildTournoiBranch
            |> ifValid \case
                Left tournoiBranch -> render NewView { .. } 
                Right tournoiBranch -> do
                    tournoiBranch <- tournoiBranch |> createRecord
                    setSuccessMessage "TournoiBranch created"
                    redirectTo TournoiBranchesAction

    action DeleteTournoiBranchAction { tournoiBranchId } = do
        tournoiBranch <- fetch tournoiBranchId
        deleteRecord tournoiBranch
        setSuccessMessage "TournoiBranch deleted"
        redirectTo TournoiBranchesAction

buildTournoiBranch tournoiBranch = tournoiBranch
    |> fill @["numero","libelle","tournoiId"]
