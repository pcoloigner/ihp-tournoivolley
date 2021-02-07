module Admin.View.PouleEquipes.Show where
import Admin.View.Prelude

data ShowView = ShowView { pouleEquipe :: PouleEquipe }

instance View ShowView where
    html ShowView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={PouleEquipesAction}>PouleEquipes</a></li>
                <li class="breadcrumb-item active">Show PouleEquipe</li>
            </ol>
        </nav>
        <h1>Show PouleEquipe</h1>
        <p>{pouleEquipe}</p>
    |]
