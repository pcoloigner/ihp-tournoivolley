module Admin.View.MatchSets.New where
import Admin.View.Prelude

data NewView = NewView { matchSet :: MatchSet }

instance View NewView where
    html NewView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={MatchSetsAction}>MatchSets</a></li>
                <li class="breadcrumb-item active">New MatchSet</li>
            </ol>
        </nav>
        <h1>New MatchSet</h1>
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
