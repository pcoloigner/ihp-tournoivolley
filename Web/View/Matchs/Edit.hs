module Web.View.Matchs.Edit where
import Web.View.Prelude

data EditView = EditView { match :: Match }

instance View EditView where
    html EditView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={MatchsAction}>Matches</a></li>
                <li class="breadcrumb-item active">Edit Match</li>
            </ol>
        </nav>
        <h1>Edit Match</h1>
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
