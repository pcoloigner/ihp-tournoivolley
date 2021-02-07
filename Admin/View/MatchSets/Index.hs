module Admin.View.MatchSets.Index where
import Admin.View.Prelude

data IndexView = IndexView { matchSets :: [MatchSet] }

instance View IndexView where
    html IndexView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item active"><a href={MatchSetsAction}>MatchSets</a></li>
            </ol>
        </nav>
        <h1>Index <a href={pathTo NewMatchSetAction} class="btn btn-primary ml-4">+ New</a></h1>
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th>MatchSet</th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>{forEach matchSets renderMatchSet}</tbody>
            </table>
        </div>
    |]


renderMatchSet matchSet = [hsx|
    <tr>
        <td>{matchSet}</td>
        <td><a href={ShowMatchSetAction (get #id matchSet)}>Show</a></td>
        <td><a href={EditMatchSetAction (get #id matchSet)} class="text-muted">Edit</a></td>
        <td><a href={DeleteMatchSetAction (get #id matchSet)} class="js-delete text-muted">Delete</a></td>
    </tr>
|]
