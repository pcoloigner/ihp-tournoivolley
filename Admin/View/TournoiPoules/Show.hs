module Admin.View.TournoiPoules.Show where
import Admin.View.Prelude

data ShowView = ShowView { tournoiPoule :: TournoiPoule }

instance View ShowView where
    html ShowView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={TournoiPoulesAction}>TournoiPoules</a></li>
                <li class="breadcrumb-item active">Show TournoiPoule</li>
            </ol>
        </nav>
        <h1>Show TournoiPoule</h1>
        <p>{tournoiPoule}</p>
    |]
