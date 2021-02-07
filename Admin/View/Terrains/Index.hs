module Admin.View.Terrains.Index where
import Admin.View.Prelude

data IndexView = IndexView { terrains :: [Terrain] }

instance View IndexView where
    html IndexView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item active"><a href={TerrainsAction}>Terrains</a></li>
            </ol>
        </nav>
        <h1>Index <a href={pathTo NewTerrainAction} class="btn btn-primary ml-4">+ New</a></h1>
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th>Terrain</th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>{forEach terrains renderTerrain}</tbody>
            </table>
        </div>
    |]


renderTerrain terrain = [hsx|
    <tr>
        <td>{terrain}</td>
        <td><a href={ShowTerrainAction (get #id terrain)}>Show</a></td>
        <td><a href={EditTerrainAction (get #id terrain)} class="text-muted">Edit</a></td>
        <td><a href={DeleteTerrainAction (get #id terrain)} class="js-delete text-muted">Delete</a></td>
    </tr>
|]
