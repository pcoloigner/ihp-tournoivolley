module Admin.View.Clubs.Show where
import Admin.View.Prelude

--data ShowView = ShowView { club :: Include "tournois" Club }
data ShowView = ShowView { club :: Club }

instance View ShowView where
    html ShowView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={ClubsAction}>Clubs</a></li>
                <li class="breadcrumb-item active">Show Club</li>
            </ol>
        </nav>
        <h1>{get #nom club}</h1>
        <div>{get #nomEntier club}</div>
        <!--<a href={NewTournoiAction (get #id club)}>Ajouter un tournoi</a> -->
        Ajouter un tournoi
        <!--<div>{forEach (get #tournois club) renderTournoi} </div>-->
    |]

renderTournoi tournoi = [hsx|
        <div class="mt-4">
            <h5>{get #nom tournoi} </h5>
            <p>{get #tournoiDate tournoi} </p>
            <p>{get #niveau tournoi} </p>
            <p>{get #tournoiType tournoi} </p>
            <p>{get #nbEquipes tournoi}  équipes</p>
        </div>
    |]