module Admin.View.MatchSets.Edit where
import Admin.View.Prelude

data EditView = EditView { matchSet :: MatchSet }

instance View EditView where
    html EditView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={MatchSetsAction}>MatchSets</a></li>
                <li class="breadcrumb-item active">Edit MatchSet</li>
            </ol>
        </nav>
        <h1>Edit MatchSet</h1>
        {renderForm matchSet}
    |]

renderForm :: MatchSet -> Html
renderForm matchSet = formFor matchSet [hsx|
    {(textField #matchId)}
    {(textField #numero)}
    {(textField #nbPointsMax)}
    {(textField #nbPoints1)}
    {(textField #nbPoints2)}
    {(textField #blCommence)}
    {(textField #blTermine)}
    {(textField #deroulement)}
    {submitButton}
|]
