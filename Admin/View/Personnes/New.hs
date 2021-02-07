module Admin.View.Personnes.New where
import Admin.View.Prelude

data NewView = NewView { personne :: Personne }

instance View NewView where
    html NewView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={PersonnesAction}>Personnes</a></li>
                <li class="breadcrumb-item active">New Personne</li>
            </ol>
        </nav>
        <h1>New Personne</h1>
        {renderForm personne}
    |]

renderForm :: Personne -> Html
renderForm personne = formFor personne [hsx|
    {(textField #identifiant)}
    {(textField #nom)}
    {(textField #prenom)}
    {(textField #mail)}
    {submitButton}
|]
