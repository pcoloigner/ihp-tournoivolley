module Web.Controller.MatchSets where

import Web.Controller.Prelude
import Web.View.MatchSets.Index
import Web.View.MatchSets.New
import Web.View.MatchSets.Edit
import Web.View.MatchSets.Show

instance Controller MatchSetsController where
    action MatchSetsAction = do
        matchSets <- query @MatchSet |> fetch
        render IndexView { .. }

    action NewMatchSetAction = do
        let matchSet = newRecord
        render NewView { .. }

    action ShowMatchSetAction { matchSetId } = do
        matchSet <- fetch matchSetId
        render ShowView { .. }

    action EditMatchSetAction { matchSetId } = do
        matchSet <- fetch matchSetId
        render EditView { .. }

    action UpdateMatchSetAction { matchSetId } = do
        matchSet <- fetch matchSetId
        matchSet
            |> buildMatchSet
            |> ifValid \case
                Left matchSet -> render EditView { .. }
                Right matchSet -> do
                    matchSet <- matchSet |> updateRecord
                    setSuccessMessage "MatchSet updated"
                    redirectTo EditMatchSetAction { .. }

    action CreateMatchSetAction = do
        let matchSet = newRecord @MatchSet
        matchSet
            |> buildMatchSet
            |> ifValid \case
                Left matchSet -> render NewView { .. } 
                Right matchSet -> do
                    matchSet <- matchSet |> createRecord
                    setSuccessMessage "MatchSet created"
                    redirectTo MatchSetsAction

    action DeleteMatchSetAction { matchSetId } = do
        matchSet <- fetch matchSetId
        deleteRecord matchSet
        setSuccessMessage "MatchSet deleted"
        redirectTo MatchSetsAction

buildMatchSet matchSet = matchSet
    |> fill @["matchId","numero","nbPointsMax","nbPoints1","nbPoints2","blCommence","blTermine","deroulement"]
