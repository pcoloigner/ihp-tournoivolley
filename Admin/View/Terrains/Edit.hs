module Admin.View.Terrains.Edit where
import Admin.View.Prelude

data EditView = EditView { terrain :: Terrain }

instance View EditView where
    html EditView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={TerrainsAction}>Terrains</a></li>
                <li class="breadcrumb-item active">Edit Terrain</li>
            </ol>
        </nav>
        <h1>Edit Terrain</h1>
        {renderForm terrain}
    |]

renderForm :: Terrain -> Html
renderForm terrain = formFor terrain [hsx|
    {(textField #numero)}
    {(textField #nom)}
    {(textField #gymnaseId)}
    {submitButton}
|]
