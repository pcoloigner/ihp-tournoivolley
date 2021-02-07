module Admin.Controller.Terrains where

import Admin.Controller.Prelude
import Admin.View.Terrains.Index
import Admin.View.Terrains.New
import Admin.View.Terrains.Edit
import Admin.View.Terrains.Show

instance Controller TerrainsController where
    action TerrainsAction = do
        terrains <- query @Terrain |> fetch
        render IndexView { .. }

    action NewTerrainAction = do
        let terrain = newRecord
        render NewView { .. }

    action ShowTerrainAction { terrainId } = do
        terrain <- fetch terrainId
        render ShowView { .. }

    action EditTerrainAction { terrainId } = do
        terrain <- fetch terrainId
        render EditView { .. }

    action UpdateTerrainAction { terrainId } = do
        terrain <- fetch terrainId
        terrain
            |> buildTerrain
            |> ifValid \case
                Left terrain -> render EditView { .. }
                Right terrain -> do
                    terrain <- terrain |> updateRecord
                    setSuccessMessage "Terrain updated"
                    redirectTo EditTerrainAction { .. }

    action CreateTerrainAction = do
        let terrain = newRecord @Terrain
        terrain
            |> buildTerrain
            |> ifValid \case
                Left terrain -> render NewView { .. } 
                Right terrain -> do
                    terrain <- terrain |> createRecord
                    setSuccessMessage "Terrain created"
                    redirectTo TerrainsAction

    action DeleteTerrainAction { terrainId } = do
        terrain <- fetch terrainId
        deleteRecord terrain
        setSuccessMessage "Terrain deleted"
        redirectTo TerrainsAction

buildTerrain terrain = terrain
    |> fill @["numero","nom","gymnaseId"]
