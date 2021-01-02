module Web.View.Equipes.Show where
import Web.View.Prelude

data ShowView = ShowView { equipe :: Equipe }

instance View ShowView where
    html ShowView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={EquipesAction}>Equipes</a></li>
                <li class="breadcrumb-item active">Show Equipe</li>
            </ol>
        </nav>
        <h1>Show Equipe</h1>
        <p>{equipe}</p>
    |]
