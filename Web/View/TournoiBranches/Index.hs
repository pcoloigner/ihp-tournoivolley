module Web.View.TournoiBranches.Index where
import Web.View.Prelude

data IndexView = IndexView { tournoiBranches :: [TournoiBranch] }

instance View IndexView where
    html IndexView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item active"><a href={TournoiBranchesAction}>TournoiBranches</a></li>
            </ol>
        </nav>
        <h1>Index <a href={pathTo NewTournoiBranchAction} class="btn btn-primary ml-4">+ New</a></h1>
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th>TournoiBranch</th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>{forEach tournoiBranches renderTournoiBranch}</tbody>
            </table>
        </div>
    |]


renderTournoiBranch tournoiBranch = [hsx|
    <tr>
        <td>{tournoiBranch}</td>
        <td><a href={ShowTournoiBranchAction (get #id tournoiBranch)}>Show</a></td>
        <td><a href={EditTournoiBranchAction (get #id tournoiBranch)} class="text-muted">Edit</a></td>
        <td><a href={DeleteTournoiBranchAction (get #id tournoiBranch)} class="js-delete text-muted">Delete</a></td>
    </tr>
|]
