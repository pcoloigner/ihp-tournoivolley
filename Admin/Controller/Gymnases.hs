module Admin.Controller.Gymnases where

import Admin.Controller.Prelude
import Admin.View.Gymnases.Index
import Admin.View.Gymnases.New
import Admin.View.Gymnases.Edit
import Admin.View.Gymnases.Show

instance Controller GymnasesController where
    action GymnasesAction = do
        gymnases <- query @Gymnase |> fetch
        render IndexView { .. }

    action NewGymnaseAction = do
        let gymnase = newRecord
        render NewView { .. }

    action ShowGymnaseAction { gymnaseId } = do
        gymnase <- fetch gymnaseId
        render ShowView { .. }

    action EditGymnaseAction { gymnaseId } = do
        gymnase <- fetch gymnaseId
        render EditView { .. }

    action UpdateGymnaseAction { gymnaseId } = do
        gymnase <- fetch gymnaseId
        gymnase
            |> buildGymnase
            |> ifValid \case
                Left gymnase -> render EditView { .. }
                Right gymnase -> do
                    gymnase <- gymnase |> updateRecord
                    setSuccessMessage "Gymnase updated"
                    redirectTo EditGymnaseAction { .. }

    action CreateGymnaseAction = do
        let gymnase = newRecord @Gymnase
        gymnase
            |> buildGymnase
            |> ifValid \case
                Left gymnase -> render NewView { .. } 
                Right gymnase -> do
                    gymnase <- gymnase |> createRecord
                    setSuccessMessage "Gymnase created"
                    redirectTo GymnasesAction

    action DeleteGymnaseAction { gymnaseId } = do
        gymnase <- fetch gymnaseId
        deleteRecord gymnase
        setSuccessMessage "Gymnase deleted"
        redirectTo GymnasesAction

buildGymnase gymnase = gymnase
    |> fill @["nom","adresse","nbTerrains"]
