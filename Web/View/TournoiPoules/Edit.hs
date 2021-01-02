module Web.View.TournoiPoules.Edit where
import Web.View.Prelude

data EditView = EditView { tournoiPoule :: TournoiPoule }

instance View EditView where
    html EditView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={TournoiPoulesAction}>TournoiPoules</a></li>
                <li class="breadcrumb-item active">Edit TournoiPoule</li>
            </ol>
        </nav>
        <h1>Edit TournoiPoule</h1>
        {renderForm tournoiPoule}
    |]

renderForm :: TournoiPoule -> Html
renderForm tournoiPoule = formFor tournoiPoule [hsx|
    {(textField #numero)}
    {(textField #libelle)}
    {(textField #nbEquipes)}
    {(textField #tournoiPhaseId)}
    {(textField #tournoiBrancheId)}
    {submitButton}
|]
