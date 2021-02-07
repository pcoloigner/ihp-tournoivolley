module Admin.View.TournoiBranches.Edit where
import Admin.View.Prelude

data EditView = EditView { tournoiBranch :: TournoiBranch }

instance View EditView where
    html EditView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={TournoiBranchesAction}>TournoiBranches</a></li>
                <li class="breadcrumb-item active">Edit TournoiBranch</li>
            </ol>
        </nav>
        <h1>Edit TournoiBranch</h1>
        {renderForm tournoiBranch}
    |]

renderForm :: TournoiBranch -> Html
renderForm tournoiBranch = formFor tournoiBranch [hsx|
    {(textField #numero)}
    {(textField #libelle)}
    {(textField #tournoiId)}
    {submitButton}
|]
