module Admin.View.Matchs.New where
import Admin.View.Prelude

data NewView = NewView { match :: Match }

instance View NewView where
    html NewView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={MatchsAction}>Matches</a></li>
                <li class="breadcrumb-item active">New Match</li>
            </ol>
        </nav>
        <h1>New Match</h1>
        {renderForm match}
    |]

renderForm :: Match -> Html
renderForm match = formFor match [hsx|
    {(textField #equipe1Id)}
    {(textField #equipe2Id)}
    {(textField #equipeArbitreId)}
    {(textField #nbSets1)}
    {(textField #nbSets2)}
    {(textField #nbPoints1)}
    {(textField #nbPoints2)}
    {(textField #bCommence)}
    {(textField #bTermine)}
    {submitButton}
|]
