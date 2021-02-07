module Admin.View.TournoiPhases.Show where
import Admin.View.Prelude

data ShowView = ShowView { tournoiPhase :: TournoiPhase }

instance View ShowView where
    html ShowView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={TournoiPhasesAction}>TournoiPhases</a></li>
                <li class="breadcrumb-item active">Show TournoiPhase</li>
            </ol>
        </nav>
        <h1>Show TournoiPhase</h1>
        <p>{tournoiPhase}</p>
    |]
