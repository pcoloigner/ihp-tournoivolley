module Admin.Controller.Tournois where

import Admin.Controller.Prelude
import Admin.View.Tournois.Index
import Admin.View.Tournois.New
import Admin.View.Tournois.Edit
import Admin.View.Tournois.Show

instance Controller TournoisController where
    action TournoisAction = do
        tournois <- query @Tournoi |> fetch
        render IndexView { .. }

    action NewTournoiAction { clubId }= do
        let tournoi = newRecord
                |> set #clubId clubId
        club <- fetch clubId
        render NewView { .. }

    action ShowTournoiAction { tournoiId } = do
        tournoi <- fetch tournoiId
        render ShowView { .. }

    action EditTournoiAction { tournoiId } = do
        tournoi <- fetch tournoiId
        render EditView { .. }

    action UpdateTournoiAction { tournoiId } = do
        tournoi <- fetch tournoiId
        tournoi
            |> buildTournoi
            |> ifValid \case
                Left tournoi -> render EditView { .. }
                Right tournoi -> do
                    tournoi <- tournoi |> updateRecord
                    setSuccessMessage "Tournoi updated"
                    redirectTo EditTournoiAction { .. }

    action CreateTournoiAction = do
        let tournoi = newRecord @Tournoi
        tournoi
            |> buildTournoi
            |> ifValid \case
                Left tournoi -> do 
                    club <- fetch ( get #clubId tournoi)
                    render NewView { .. } 
                Right tournoi -> do
                    tournoi <- tournoi |> createRecord
                    setSuccessMessage "Tournoi created"
                    redirectTo ShowClubAction { clubId = get #clubId tournoi}

    action DeleteTournoiAction { tournoiId } = do
        tournoi <- fetch tournoiId
        deleteRecord tournoi
        setSuccessMessage "Tournoi deleted"
        redirectTo TournoisAction

buildTournoi tournoi = tournoi
    |> fill @["nom","tournoiDate","niveau","tournoiType","nbEquipes","clubId", "nbTerrains", "nbGymnases"]
