module Web.View.Terrains.New where
import Web.View.Prelude

data NewView = NewView { terrain :: Terrain }

instance View NewView where
    html NewView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={TerrainsAction}>Terrains</a></li>
                <li class="breadcrumb-item active">New Terrain</li>
            </ol>
        </nav>
        <h1>New Terrain</h1>
        {renderForm terrain}
    |]

renderForm :: Terrain -> Html
renderForm terrain = formFor terrain [hsx|
    {(textField #numero)}
    {(textField #nom)}
    {(textField #gymnaseId)}
    {submitButton}
|]
