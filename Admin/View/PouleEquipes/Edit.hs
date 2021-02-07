module Admin.View.PouleEquipes.Edit where
import Admin.View.Prelude

data EditView = EditView { pouleEquipe :: PouleEquipe }

instance View EditView where
    html EditView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={PouleEquipesAction}>PouleEquipes</a></li>
                <li class="breadcrumb-item active">Edit PouleEquipe</li>
            </ol>
        </nav>
        <h1>Edit PouleEquipe</h1>
        {renderForm pouleEquipe}
    |]

renderForm :: PouleEquipe -> Html
renderForm pouleEquipe = formFor pouleEquipe [hsx|
    {(textField #numero)}
    {(textField #tournoiPouleId)}
    {(textField #equipeId)}
    {submitButton}
|]
