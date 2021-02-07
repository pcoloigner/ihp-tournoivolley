module Admin.View.Clubs.Index where
import Admin.View.Prelude

data IndexView = IndexView { clubs :: [Club] }

instance View IndexView where
    html IndexView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item active"><a href={ClubsAction}>Clubs</a></li>
            </ol>
        </nav>
        <h1>Index <a href={pathTo NewClubAction} class="btn btn-primary ml-4">+ New</a></h1>
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th>Club</th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>{forEach clubs renderClub}</tbody>
            </table>
        </div>
    |]


renderClub club = [hsx|
    <tr>
        <td><a href={ShowClubAction (get #id club)}>   {get #nom club}</a> </td>
        <td><a href={EditClubAction (get #id club)} class="text-muted">Edit</a></td>
        <td><a href={DeleteClubAction (get #id club)} class="js-delete text-muted">Delete</a></td>
    </tr>
|]
