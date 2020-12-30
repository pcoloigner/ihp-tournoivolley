module Web.View.Clubs.Edit where
import Web.View.Prelude

data EditView = EditView { club :: Club }

instance View EditView where
    html EditView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={ClubsAction}>Clubs</a></li>
                <li class="breadcrumb-item active">Edit Club</li>
            </ol>
        </nav>
        <h1>Edit Club</h1>
        {renderForm club}
    |]

renderForm :: Club -> Html
renderForm club = formFor club [hsx|
    {(textField #nom)}
    {(textField #nomEntier)}
    {submitButton}
|]
