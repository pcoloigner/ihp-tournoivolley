module Web.View.Gymnases.Edit where
import Web.View.Prelude

data EditView = EditView { gymnase :: Gymnase }

instance View EditView where
    html EditView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={GymnasesAction}>Gymnases</a></li>
                <li class="breadcrumb-item active">Edit Gymnase</li>
            </ol>
        </nav>
        <h1>Edit Gymnase</h1>
        {renderForm gymnase}
    |]

renderForm :: Gymnase -> Html
renderForm gymnase = formFor gymnase [hsx|
    {(textField #nom)}
    {(textField #adresse)}
    {(textField #nbTerrains)}
    {submitButton}
|]
