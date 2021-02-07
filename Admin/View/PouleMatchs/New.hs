module Admin.View.PouleMatchs.New where
import Admin.View.Prelude

data NewView = NewView { pouleMatch :: PouleMatch }

instance View NewView where
    html NewView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={PouleMatchsAction}>PouleMatchs</a></li>
                <li class="breadcrumb-item active">New PouleMatch</li>
            </ol>
        </nav>
        <h1>New PouleMatch</h1>
        {renderForm pouleMatch}
    |]

renderForm :: PouleMatch -> Html
renderForm pouleMatch = formFor pouleMatch [hsx|

    {submitButton}
|]
