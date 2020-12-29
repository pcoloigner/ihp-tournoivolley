module Web.View.Club.New where
import Web.View.Prelude

data NewView = NewView { club :: Club }

instance View NewView where
    html NewView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={ClubsAction}>Clubs</a></li>
                <li class="breadcrumb-item active">New Club</li>
            </ol>
        </nav>
        <h1>New Club</h1>
        {renderForm club}
    |]

renderForm :: Club -> Html
renderForm club = formFor club [hsx|

    {submitButton}
|]
