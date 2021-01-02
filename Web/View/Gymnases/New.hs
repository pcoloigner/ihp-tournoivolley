module Web.View.Gymnases.New where
import Web.View.Prelude

data NewView = NewView { gymnase :: Gymnase }

instance View NewView where
    html NewView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={GymnasesAction}>Gymnases</a></li>
                <li class="breadcrumb-item active">New Gymnase</li>
            </ol>
        </nav>
        <h1>New Gymnase</h1>
        {renderForm gymnase}
    |]

renderForm :: Gymnase -> Html
renderForm gymnase = formFor gymnase [hsx|
    {(textField #nom)}
    {(textField #adresse)}
    {(textField #nbTerrains)}
    {submitButton}
|]
