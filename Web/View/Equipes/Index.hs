module Web.View.Equipes.Index where
import Web.View.Prelude

data IndexView = IndexView { equipes :: [Equipe] }

instance View IndexView where
    html IndexView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item active"><a href={EquipesAction}>Equipes</a></li>
            </ol>
        </nav>
        <h1>Index <a href={pathTo NewEquipeAction} class="btn btn-primary ml-4">+ New</a></h1>
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th>Equipe</th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>{forEach equipes renderEquipe}</tbody>
            </table>
        </div>
    |]


renderEquipe equipe = [hsx|
    <tr>
        <td>{equipe}</td>
        <td><a href={ShowEquipeAction (get #id equipe)}>Show</a></td>
        <td><a href={EditEquipeAction (get #id equipe)} class="text-muted">Edit</a></td>
        <td><a href={DeleteEquipeAction (get #id equipe)} class="js-delete text-muted">Delete</a></td>
    </tr>
|]
