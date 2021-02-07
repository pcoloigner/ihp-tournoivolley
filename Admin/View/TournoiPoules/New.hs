module Admin.View.TournoiPoules.New where
import Admin.View.Prelude

data NewView = NewView { tournoiPoule :: TournoiPoule }

instance View NewView where
    html NewView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={TournoiPoulesAction}>TournoiPoules</a></li>
                <li class="breadcrumb-item active">New TournoiPoule</li>
            </ol>
        </nav>
        <h1>New TournoiPoule</h1>
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
