module Web.Controller.PouleMatchs where

import Web.Controller.Prelude
import Web.View.PouleMatchs.Index
import Web.View.PouleMatchs.New
import Web.View.PouleMatchs.Edit
import Web.View.PouleMatchs.Show

instance Controller PouleMatchsController where
    action PouleMatchsAction = do
        pouleMatchs <- query @PouleMatch |> fetch
        render IndexView { .. }

    action NewPouleMatchAction = do
        let pouleMatch = newRecord
        render NewView { .. }

    action ShowPouleMatchAction { pouleMatchId } = do
        pouleMatch <- fetch pouleMatchId
        render ShowView { .. }

    action EditPouleMatchAction { pouleMatchId } = do
        pouleMatch <- fetch pouleMatchId
        render EditView { .. }

    action UpdatePouleMatchAction { pouleMatchId } = do
        pouleMatch <- fetch pouleMatchId
        pouleMatch
            |> buildPouleMatch
            |> ifValid \case
                Left pouleMatch -> render EditView { .. }
                Right pouleMatch -> do
                    pouleMatch <- pouleMatch |> updateRecord
                    setSuccessMessage "PouleMatch updated"
                    redirectTo EditPouleMatchAction { .. }

    action CreatePouleMatchAction = do
        let pouleMatch = newRecord @PouleMatch
        pouleMatch
            |> buildPouleMatch
            |> ifValid \case
                Left pouleMatch -> render NewView { .. } 
                Right pouleMatch -> do
                    pouleMatch <- pouleMatch |> createRecord
                    setSuccessMessage "PouleMatch created"
                    redirectTo PouleMatchsAction

    action DeletePouleMatchAction { pouleMatchId } = do
        pouleMatch <- fetch pouleMatchId
        deleteRecord pouleMatch
        setSuccessMessage "PouleMatch deleted"
        redirectTo PouleMatchsAction

buildPouleMatch pouleMatch = pouleMatch
    |> fill @'[]
