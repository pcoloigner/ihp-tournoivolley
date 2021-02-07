module Admin.View.PouleMatchs.Index where
import Admin.View.Prelude

data IndexView = IndexView { pouleMatchs :: [PouleMatch] }

instance View IndexView where
    html IndexView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item active"><a href={PouleMatchsAction}>PouleMatchs</a></li>
            </ol>
        </nav>
        <h1>Index <a href={pathTo NewPouleMatchAction} class="btn btn-primary ml-4">+ New</a></h1>
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th>PouleMatch</th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>{forEach pouleMatchs renderPouleMatch}</tbody>
            </table>
        </div>
    |]


renderPouleMatch pouleMatch = [hsx|
    <tr>
        <td>{pouleMatch}</td>
        <td><a href={ShowPouleMatchAction (get #id pouleMatch)}>Show</a></td>
        <td><a href={EditPouleMatchAction (get #id pouleMatch)} class="text-muted">Edit</a></td>
        <td><a href={DeletePouleMatchAction (get #id pouleMatch)} class="js-delete text-muted">Delete</a></td>
    </tr>
|]
