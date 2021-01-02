module Web.View.Matchs.Show where
import Web.View.Prelude

data ShowView = ShowView { match :: Match }

instance View ShowView where
    html ShowView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={MatchsAction}>Matches</a></li>
                <li class="breadcrumb-item active">Show Match</li>
            </ol>
        </nav>
        <h1>Show Match</h1>
        <p>{match}</p>
    |]
