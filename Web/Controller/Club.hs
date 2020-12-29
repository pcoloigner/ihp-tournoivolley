module Web.Controller.Club where

import Web.Controller.Prelude
import Web.View.Club.Index
import Web.View.Club.New
import Web.View.Club.Edit
import Web.View.Club.Show

instance Controller ClubController where
    action ClubsAction = do
        club <- query @Club |> fetch
        render IndexView { .. }

    action NewClubAction = do
        let club = newRecord
        render NewView { .. }

    action ShowClubAction { clubId } = do
        club <- fetch clubId
        render ShowView { .. }

    action EditClubAction { clubId } = do
        club <- fetch clubId
        render EditView { .. }

    action UpdateClubAction { clubId } = do
        club <- fetch clubId
        club
            |> buildClub
            |> ifValid \case
                Left club -> render EditView { .. }
                Right club -> do
                    club <- club |> updateRecord
                    setSuccessMessage "Club updated"
                    redirectTo EditClubAction { .. }

    action CreateClubAction = do
        let club = newRecord @Club
        club
            |> buildClub
            |> ifValid \case
                Left club -> render NewView { .. } 
                Right club -> do
                    club <- club |> createRecord
                    setSuccessMessage "Club created"
                    redirectTo ClubsAction

    action DeleteClubAction { clubId } = do
        club <- fetch clubId
        deleteRecord club
        setSuccessMessage "Club deleted"
        redirectTo ClubsAction

buildClub club = club
    |> fill @'[]
