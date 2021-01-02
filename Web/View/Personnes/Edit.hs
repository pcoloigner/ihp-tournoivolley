module Web.View.Personnes.Edit where
import Web.View.Prelude

data EditView = EditView { personne :: Personne }

instance View EditView where
    html EditView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={PersonnesAction}>Personnes</a></li>
                <li class="breadcrumb-item active">Edit Personne</li>
            </ol>
        </nav>
        <h1>Edit Personne</h1>
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
