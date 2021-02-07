module Admin.View.MatchSets.Show where
import Admin.View.Prelude

data ShowView = ShowView { matchSet :: MatchSet }

instance View ShowView where
    html ShowView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={MatchSetsAction}>MatchSets</a></li>
                <li class="breadcrumb-item active">Show MatchSet</li>
            </ol>
        </nav>
        <h1>Show MatchSet</h1>
        <p>{matchSet}</p>
    |]
