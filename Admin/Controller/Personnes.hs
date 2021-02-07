module Admin.Controller.Personnes where

import Admin.Controller.Prelude
import Admin.View.Personnes.Index
import Admin.View.Personnes.New
import Admin.View.Personnes.Edit
import Web.View.Personnes.Show

instance Controller PersonnesController where
    action PersonnesAction = do
        personnes <- query @Personne |> fetch
        render IndexView { .. }

    action NewPersonneAction = do
        let personne = newRecord
        render NewView { .. }

    action ShowPersonneAction { personneId } = do
        personne <- fetch personneId
        render ShowView { .. }

    action EditPersonneAction { personneId } = do
        personne <- fetch personneId
        render EditView { .. }

    action UpdatePersonneAction { personneId } = do
        personne <- fetch personneId
        personne
            |> buildPersonne
            |> ifValid \case
                Left personne -> render EditView { .. }
                Right personne -> do
                    personne <- personne |> updateRecord
                    setSuccessMessage "Personne updated"
                    redirectTo EditPersonneAction { .. }

    action CreatePersonneAction = do
        let personne = newRecord @Personne
        personne
            |> buildPersonne
            |> ifValid \case
                Left personne -> render NewView { .. } 
                Right personne -> do
                    personne <- personne |> createRecord
                    setSuccessMessage "Personne created"
                    redirectTo PersonnesAction

    action DeletePersonneAction { personneId } = do
        personne <- fetch personneId
        deleteRecord personne
        setSuccessMessage "Personne deleted"
        redirectTo PersonnesAction

buildPersonne personne = personne
    |> fill @["identifiant","nom","prenom","mail"]
