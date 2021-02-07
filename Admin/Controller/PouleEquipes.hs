module Admin.Controller.PouleEquipes where

import Admin.Controller.Prelude
import Admin.View.PouleEquipes.Index
import Admin.View.PouleEquipes.New
import Admin.View.PouleEquipes.Edit
import Admin.View.PouleEquipes.Show

instance Controller PouleEquipesController where
    action PouleEquipesAction = do
        pouleEquipes <- query @PouleEquipe |> fetch
        render IndexView { .. }

    action NewPouleEquipeAction = do
        let pouleEquipe = newRecord
        render NewView { .. }

    action ShowPouleEquipeAction { pouleEquipeId } = do
        pouleEquipe <- fetch pouleEquipeId
        render ShowView { .. }

    action EditPouleEquipeAction { pouleEquipeId } = do
        pouleEquipe <- fetch pouleEquipeId
        render EditView { .. }

    action UpdatePouleEquipeAction { pouleEquipeId } = do
        pouleEquipe <- fetch pouleEquipeId
        pouleEquipe
            |> buildPouleEquipe
            |> ifValid \case
                Left pouleEquipe -> render EditView { .. }
                Right pouleEquipe -> do
                    pouleEquipe <- pouleEquipe |> updateRecord
                    setSuccessMessage "PouleEquipe updated"
                    redirectTo EditPouleEquipeAction { .. }

    action CreatePouleEquipeAction = do
        let pouleEquipe = newRecord @PouleEquipe
        pouleEquipe
            |> buildPouleEquipe
            |> ifValid \case
                Left pouleEquipe -> render NewView { .. } 
                Right pouleEquipe -> do
                    pouleEquipe <- pouleEquipe |> createRecord
                    setSuccessMessage "PouleEquipe created"
                    redirectTo PouleEquipesAction

    action DeletePouleEquipeAction { pouleEquipeId } = do
        pouleEquipe <- fetch pouleEquipeId
        deleteRecord pouleEquipe
        setSuccessMessage "PouleEquipe deleted"
        redirectTo PouleEquipesAction

buildPouleEquipe pouleEquipe = pouleEquipe
    |> fill @["numero","tournoiPouleId","equipeId"]
