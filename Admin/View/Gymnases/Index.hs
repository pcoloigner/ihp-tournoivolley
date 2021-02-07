module Admin.View.Gymnases.Index where
import Admin.View.Prelude

data IndexView = IndexView { gymnases :: [Gymnase] }

instance View IndexView where
    html IndexView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item active"><a href={GymnasesAction}>Gymnases</a></li>
            </ol>
        </nav>
        <h1>Index <a href={pathTo NewGymnaseAction} class="btn btn-primary ml-4">+ New</a></h1>
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th>Gymnase</th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>{forEach gymnases renderGymnase}</tbody>
            </table>
        </div>
    |]


renderGymnase gymnase = [hsx|
    <tr>
        <td>{gymnase}</td>
        <td><a href={ShowGymnaseAction (get #id gymnase)}>Show</a></td>
        <td><a href={EditGymnaseAction (get #id gymnase)} class="text-muted">Edit</a></td>
        <td><a href={DeleteGymnaseAction (get #id gymnase)} class="js-delete text-muted">Delete</a></td>
    </tr>
|]
