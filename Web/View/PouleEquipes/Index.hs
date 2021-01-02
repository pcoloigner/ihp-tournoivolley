module Web.View.PouleEquipes.Index where
import Web.View.Prelude

data IndexView = IndexView { pouleEquipes :: [PouleEquipe] }

instance View IndexView where
    html IndexView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item active"><a href={PouleEquipesAction}>PouleEquipes</a></li>
            </ol>
        </nav>
        <h1>Index <a href={pathTo NewPouleEquipeAction} class="btn btn-primary ml-4">+ New</a></h1>
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th>PouleEquipe</th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>{forEach pouleEquipes renderPouleEquipe}</tbody>
            </table>
        </div>
    |]


renderPouleEquipe pouleEquipe = [hsx|
    <tr>
        <td>{pouleEquipe}</td>
        <td><a href={ShowPouleEquipeAction (get #id pouleEquipe)}>Show</a></td>
        <td><a href={EditPouleEquipeAction (get #id pouleEquipe)} class="text-muted">Edit</a></td>
        <td><a href={DeletePouleEquipeAction (get #id pouleEquipe)} class="js-delete text-muted">Delete</a></td>
    </tr>
|]
