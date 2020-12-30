module Web.Controller.Clubs where

import Web.Controller.Prelude
import Web.View.Clubs.Index
import Web.View.Clubs.New
import Web.View.Clubs.Edit
import Web.View.Clubs.Show

instance Controller ClubsController where
    action ClubsAction = do
        clubs <- query @Club |> fetch
        render IndexView { .. }

    action NewClubAction = do
        let club = newRecord
        render NewView { .. }

    action ShowClubAction { clubId } = do
        club <- fetch clubId
            >>= fetchRelated #tournois
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
    |> fill @["nom","nomEntier"]
    |> validateField #nom nonEmpty

