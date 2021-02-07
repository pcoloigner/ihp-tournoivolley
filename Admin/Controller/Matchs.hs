module Admin.Controller.Matchs where

import Admin.Controller.Prelude
import Admin.View.Matchs.Index
import Admin.View.Matchs.New
import Admin.View.Matchs.Edit
import Admin.View.Matchs.Show

instance Controller MatchsController where
    action MatchsAction = do
        matchs <- query @Match |> fetch
        render IndexView { .. }

    action NewMatchAction = do
        let match = newRecord
        render NewView { .. }

    action ShowMatchAction { matchId } = do
        match <- fetch matchId
        render ShowView { .. }

    action EditMatchAction { matchId } = do
        match <- fetch matchId
        render EditView { .. }

    action UpdateMatchAction { matchId } = do
        match <- fetch matchId
        match
            |> buildMatch
            |> ifValid \case
                Left match -> render EditView { .. }
                Right match -> do
                    match <- match |> updateRecord
                    setSuccessMessage "Match updated"
                    redirectTo EditMatchAction { .. }

    action CreateMatchAction = do
        let match = newRecord @Match
        match
            |> buildMatch
            |> ifValid \case
                Left match -> render NewView { .. } 
                Right match -> do
                    match <- match |> createRecord
                    setSuccessMessage "Match created"
                    redirectTo MatchsAction

    action DeleteMatchAction { matchId } = do
        match <- fetch matchId
        deleteRecord match
        setSuccessMessage "Match deleted"
        redirectTo MatchsAction

buildMatch match = match
    |> fill @'[]
