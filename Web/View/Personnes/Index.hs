module Web.View.Personnes.Index where
import Web.View.Prelude

data IndexView = IndexView { personnes :: [Personne] }

instance View IndexView where
    html IndexView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item active"><a href={PersonnesAction}>Personnes</a></li>
            </ol>
        </nav>
        <h1>Index <a href={pathTo NewPersonneAction} class="btn btn-primary ml-4">+ New</a></h1>
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th>Personne</th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>{forEach personnes renderPersonne}</tbody>
            </table>
        </div>
    |]


renderPersonne personne = [hsx|
    <tr>
        <td>{personne}</td>
        <td><a href={ShowPersonneAction (get #id personne)}>Show</a></td>
        <td><a href={EditPersonneAction (get #id personne)} class="text-muted">Edit</a></td>
        <td><a href={DeletePersonneAction (get #id personne)} class="js-delete text-muted">Delete</a></td>
    </tr>
|]
