module Web.View.TournoiBranches.Show where
import Web.View.Prelude

data ShowView = ShowView { tournoiBranch :: TournoiBranch }

instance View ShowView where
    html ShowView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={TournoiBranchesAction}>TournoiBranches</a></li>
                <li class="breadcrumb-item active">Show TournoiBranch</li>
            </ol>
        </nav>
        <h1>Show TournoiBranch</h1>
        <p>{tournoiBranch}</p>
    |]
