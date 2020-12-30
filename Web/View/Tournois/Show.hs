module Web.View.Tournois.Show where
import Web.View.Prelude

data ShowView = ShowView { tournoi :: Tournoi }

instance View ShowView where
    html ShowView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={TournoisAction}>Tournois</a></li>
                <li class="breadcrumb-item active">Show Tournoi</li>
            </ol>
        </nav>
        <h1>Show Tournoi</h1>
        <p>{tournoi}</p>
    |]
