module Web.View.TournoiPhases.New where
import Web.View.Prelude

data NewView = NewView { tournoiPhase :: TournoiPhase }

instance View NewView where
    html NewView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={TournoiPhasesAction}>TournoiPhases</a></li>
                <li class="breadcrumb-item active">New TournoiPhase</li>
            </ol>
        </nav>
        <h1>New TournoiPhase</h1>
        {renderForm tournoiPhase}
    |]

renderForm :: TournoiPhase -> Html
renderForm tournoiPhase = formFor tournoiPhase [hsx|
    {(textField #numero)}
    {(textField #libelle)}
    {(textField #tournoiId)}
    {submitButton}
|]
