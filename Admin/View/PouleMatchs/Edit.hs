module Admin.View.PouleMatchs.Edit where
import Admin.View.Prelude

data EditView = EditView { pouleMatch :: PouleMatch }

instance View EditView where
    html EditView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={PouleMatchsAction}>PouleMatchs</a></li>
                <li class="breadcrumb-item active">Edit PouleMatch</li>
            </ol>
        </nav>
        <h1>Edit PouleMatch</h1>
        {renderForm pouleMatch}
    |]

renderForm :: PouleMatch -> Html
renderForm pouleMatch = formFor pouleMatch [hsx|

    {submitButton}
|]
