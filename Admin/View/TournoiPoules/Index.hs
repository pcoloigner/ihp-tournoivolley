module Admin.View.TournoiPoules.Index where
import Admin.View.Prelude

data IndexView = IndexView { tournoiPoules :: [TournoiPoule] }

instance View IndexView where
    html IndexView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item active"><a href={TournoiPoulesAction}>TournoiPoules</a></li>
            </ol>
        </nav>
        <h1>Index <a href={pathTo NewTournoiPouleAction} class="btn btn-primary ml-4">+ New</a></h1>
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th>TournoiPoule</th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>{forEach tournoiPoules renderTournoiPoule}</tbody>
            </table>
        </div>
    |]


renderTournoiPoule tournoiPoule = [hsx|
    <tr>
        <td>{tournoiPoule}</td>
        <td><a href={ShowTournoiPouleAction (get #id tournoiPoule)}>Show</a></td>
        <td><a href={EditTournoiPouleAction (get #id tournoiPoule)} class="text-muted">Edit</a></td>
        <td><a href={DeleteTournoiPouleAction (get #id tournoiPoule)} class="js-delete text-muted">Delete</a></td>
    </tr>
|]
