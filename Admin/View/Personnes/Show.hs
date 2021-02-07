module Admin.View.Personnes.Show where
import Admin.View.Prelude

data ShowView = ShowView { personne :: Personne }

instance View ShowView where
    html ShowView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={PersonnesAction}>Personnes</a></li>
                <li class="breadcrumb-item active">Show Personne</li>
            </ol>
        </nav>
        <h1>Show Personne</h1>
        <p>{personne}</p>
    |]
