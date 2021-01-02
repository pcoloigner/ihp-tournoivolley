module Web.View.PouleMatchs.Show where
import Web.View.Prelude

data ShowView = ShowView { pouleMatch :: PouleMatch }

instance View ShowView where
    html ShowView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={PouleMatchesAction}>PouleMatches</a></li>
                <li class="breadcrumb-item active">Show PouleMatch</li>
            </ol>
        </nav>
        <h1>Show PouleMatch</h1>
        <p>{pouleMatch}</p>
    |]
