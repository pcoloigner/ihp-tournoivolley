module Web.View.Tournois.New where
import Web.View.Prelude

data NewView = NewView { tournoi :: Tournoi
                       , club :: Club
                       }

instance View NewView where
    html NewView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={TournoisAction}>Tournois</a></li>
                <li class="breadcrumb-item active">New Tournoi</li>
            </ol>
        </nav>
        <h1>Nouveau tournoi organisé par le club : <q>{get #nomEntier club}</q></h1>
        {renderForm tournoi}
    |]

renderForm :: Tournoi -> Html
renderForm tournoi = formFor tournoi [hsx|
    {(textField #nom)}
    {(textField #tournoiDate)}
    {(textField #niveau)}
    {(textField #tournoiType)}
    {(textField #nbEquipes)}
    {(hiddenField #clubId)}
    {submitButton}
|]
