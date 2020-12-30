module Web.View.Tournois.Edit where
import Web.View.Prelude

data EditView = EditView { tournoi :: Tournoi }

instance View EditView where
    html EditView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={TournoisAction}>Tournois</a></li>
                <li class="breadcrumb-item active">Edit Tournoi</li>
            </ol>
        </nav>
        <h1>Edit Tournoi</h1>
        {renderForm tournoi}
    |]

renderForm :: Tournoi -> Html
renderForm tournoi = formFor tournoi [hsx|
    {(textField #nom)}
    {(textField #tournoiDate)}
    {(textField #niveau)}
    {(textField #tournoiType)}
    {(textField #nbEquipes)}
    {(textField #clubId)}
    {submitButton}
|]
