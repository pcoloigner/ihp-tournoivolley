module Admin.View.Terrains.Show where
import Admin.View.Prelude

data ShowView = ShowView { terrain :: Terrain }

instance View ShowView where
    html ShowView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={TerrainsAction}>Terrains</a></li>
                <li class="breadcrumb-item active">Show Terrain</li>
            </ol>
        </nav>
        <h1>Show Terrain</h1>
        <p>{terrain}</p>
    |]
