module Web.View.TournoiPhases.Edit where
import Web.View.Prelude

data EditView = EditView { tournoiPhase :: TournoiPhase }

instance View EditView where
    html EditView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={TournoiPhasesAction}>TournoiPhases</a></li>
                <li class="breadcrumb-item active">Edit TournoiPhase</li>
            </ol>
        </nav>
        <h1>Edit TournoiPhase</h1>
        {renderForm tournoiPhase}
    |]

renderForm :: TournoiPhase -> Html
renderForm tournoiPhase = formFor tournoiPhase [hsx|
    {(textField #numero)}
    {(textField #libelle)}
    {(textField #tournoiId)}
    {submitButton}
|]
