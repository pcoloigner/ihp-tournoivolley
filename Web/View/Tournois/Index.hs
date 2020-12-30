module Web.View.Tournois.Index where
import Web.View.Prelude

data IndexView = IndexView { tournois :: [Tournoi] }

instance View IndexView where
    html IndexView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item active"><a href={TournoisAction}>Tournois</a></li>
            </ol>
        </nav>
        <h1>Tournois</h1>
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th>Tournoi</th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>{forEach tournois renderTournoi}</tbody>
            </table>
        </div>
    |]


renderTournoi tournoi = [hsx|
    <tr>
        <td>{tournoi}</td>
        <td><a href={ShowTournoiAction (get #id tournoi)}>Show</a></td>
        <td><a href={EditTournoiAction (get #id tournoi)} class="text-muted">Edit</a></td>
        <td><a href={DeleteTournoiAction (get #id tournoi)} class="js-delete text-muted">Delete</a></td>
    </tr>
|]
