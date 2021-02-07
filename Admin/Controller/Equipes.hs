module Admin.Controller.Equipes where

import Admin.Controller.Prelude
import Admin.View.Equipes.Index
import Admin.View.Equipes.New
import Admin.View.Equipes.Edit
import Admin.View.Equipes.Show

instance Controller EquipesController where
    action EquipesAction = do
        equipes <- query @Equipe |> fetch
        render IndexView { .. }

    action NewEquipeAction = do
        let equipe = newRecord
        render NewView { .. }

    action ShowEquipeAction { equipeId } = do
        equipe <- fetch equipeId
        render ShowView { .. }

    action EditEquipeAction { equipeId } = do
        equipe <- fetch equipeId
        render EditView { .. }

    action UpdateEquipeAction { equipeId } = do
        equipe <- fetch equipeId
        equipe
            |> buildEquipe
            |> ifValid \case
                Left equipe -> render EditView { .. }
                Right equipe -> do
                    equipe <- equipe |> updateRecord
                    setSuccessMessage "Equipe updated"
                    redirectTo EditEquipeAction { .. }

    action CreateEquipeAction = do
        let equipe = newRecord @Equipe
        equipe
            |> buildEquipe
            |> ifValid \case
                Left equipe -> render NewView { .. } 
                Right equipe -> do
                    equipe <- equipe |> createRecord
                    setSuccessMessage "Equipe created"
                    redirectTo EquipesAction

    action DeleteEquipeAction { equipeId } = do
        equipe <- fetch equipeId
        deleteRecord equipe
        setSuccessMessage "Equipe deleted"
        redirectTo EquipesAction

buildEquipe equipe = equipe
    |> fill @["nom","niveau","tournoiId"]
