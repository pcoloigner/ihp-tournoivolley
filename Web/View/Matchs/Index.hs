module Web.View.Matchs.Index where
import Web.View.Prelude

data IndexView = IndexView { matchs :: [Match] }

instance View IndexView where
    html IndexView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item active"><a href={MatchsAction}>Matches</a></li>
            </ol>
        </nav>
        <h1>Index <a href={pathTo NewMatchAction} class="btn btn-primary ml-4">+ New</a></h1>
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th>Match</th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>{forEach matchs renderMatch}</tbody>
            </table>
        </div>
    |]


renderMatch match = [hsx|
    <tr>
        <td>{match}</td>
        <td><a href={ShowMatchAction (get #id match)}>Show</a></td>
        <td><a href={EditMatchAction (get #id match)} class="text-muted">Edit</a></td>
        <td><a href={DeleteMatchAction (get #id match)} class="js-delete text-muted">Delete</a></td>
    </tr>
|]
