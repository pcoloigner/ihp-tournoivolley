module Web.View.TournoiBranches.New where
import Web.View.Prelude

data NewView = NewView { tournoiBranch :: TournoiBranch }

instance View NewView where
    html NewView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={TournoiBranchesAction}>TournoiBranches</a></li>
                <li class="breadcrumb-item active">New TournoiBranch</li>
            </ol>
        </nav>
        <h1>New TournoiBranch</h1>
        {renderForm tournoiBranch}
    |]

renderForm :: TournoiBranch -> Html
renderForm tournoiBranch = formFor tournoiBranch [hsx|
    {(textField #numero)}
    {(textField #libelle)}
    {(textField #tournoiId)}
    {submitButton}
|]
