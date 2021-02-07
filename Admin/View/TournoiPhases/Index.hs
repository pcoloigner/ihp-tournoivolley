module Admin.View.TournoiPhases.Index where
import Admin.View.Prelude

data IndexView = IndexView { tournoiPhases :: [TournoiPhase] }

instance View IndexView where
    html IndexView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item active"><a href={TournoiPhasesAction}>TournoiPhases</a></li>
            </ol>
        </nav>
        <h1>Index <a href={pathTo NewTournoiPhaseAction} class="btn btn-primary ml-4">+ New</a></h1>
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th>TournoiPhase</th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>{forEach tournoiPhases renderTournoiPhase}</tbody>
            </table>
        </div>
    |]


renderTournoiPhase tournoiPhase = [hsx|
    <tr>
        <td>{tournoiPhase}</td>
        <td><a href={ShowTournoiPhaseAction (get #id tournoiPhase)}>Show</a></td>
        <td><a href={EditTournoiPhaseAction (get #id tournoiPhase)} class="text-muted">Edit</a></td>
        <td><a href={DeleteTournoiPhaseAction (get #id tournoiPhase)} class="js-delete text-muted">Delete</a></td>
    </tr>
|]
