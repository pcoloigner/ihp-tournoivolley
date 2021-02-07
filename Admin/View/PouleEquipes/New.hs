module Admin.View.PouleEquipes.New where
import Admin.View.Prelude

data NewView = NewView { pouleEquipe :: PouleEquipe }

instance View NewView where
    html NewView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={PouleEquipesAction}>PouleEquipes</a></li>
                <li class="breadcrumb-item active">New PouleEquipe</li>
            </ol>
        </nav>
        <h1>New PouleEquipe</h1>
        {renderForm pouleEquipe}
    |]

renderForm :: PouleEquipe -> Html
renderForm pouleEquipe = formFor pouleEquipe [hsx|
    {(textField #numero)}
    {(textField #tournoiPouleId)}
    {(textField #equipeId)}
    {submitButton}
|]
