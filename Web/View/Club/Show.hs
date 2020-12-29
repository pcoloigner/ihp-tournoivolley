module Web.View.Club.Show where
import Web.View.Prelude

data ShowView = ShowView { club :: Club }

instance View ShowView where
    html ShowView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={ClubsAction}>Clubs</a></li>
                <li class="breadcrumb-item active">Show Club</li>
            </ol>
        </nav>
        <h1>Show Club</h1>
        <p>{club}</p>
    |]
