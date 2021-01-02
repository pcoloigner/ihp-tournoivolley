module Web.Types where

import IHP.Prelude
import IHP.ModelSupport
import Generated.Types

data WebApplication = WebApplication deriving (Eq, Show)


data StaticController = WelcomeAction deriving (Eq, Show, Data)

data ClubsController
    = ClubsAction
    | NewClubAction
    | ShowClubAction { clubId :: !(Id Club) }
    | CreateClubAction
    | EditClubAction { clubId :: !(Id Club) }
    | UpdateClubAction { clubId :: !(Id Club) }
    | DeleteClubAction { clubId :: !(Id Club) }
    deriving (Eq, Show, Data)

data TournoisController
    = TournoisAction
    | NewTournoiAction { clubId :: !(Id Club) }
    | ShowTournoiAction { tournoiId :: !(Id Tournoi) }
    | CreateTournoiAction
    | EditTournoiAction { tournoiId :: !(Id Tournoi) }
    | UpdateTournoiAction { tournoiId :: !(Id Tournoi) }
    | DeleteTournoiAction { tournoiId :: !(Id Tournoi) }
    deriving (Eq, Show, Data)

data PersonnesController
    = PersonnesAction
    | NewPersonneAction
    | ShowPersonneAction { personneId :: !(Id Personne) }
    | CreatePersonneAction
    | EditPersonneAction { personneId :: !(Id Personne) }
    | UpdatePersonneAction { personneId :: !(Id Personne) }
    | DeletePersonneAction { personneId :: !(Id Personne) }
    deriving (Eq, Show, Data)

data EquipesController
    = EquipesAction
    | NewEquipeAction
    | ShowEquipeAction { equipeId :: !(Id Equipe) }
    | CreateEquipeAction
    | EditEquipeAction { equipeId :: !(Id Equipe) }
    | UpdateEquipeAction { equipeId :: !(Id Equipe) }
    | DeleteEquipeAction { equipeId :: !(Id Equipe) }
    deriving (Eq, Show, Data)

data TournoiPhasesController
    = TournoiPhasesAction
    | NewTournoiPhaseAction
    | ShowTournoiPhaseAction { tournoiPhaseId :: !(Id TournoiPhase) }
    | CreateTournoiPhaseAction
    | EditTournoiPhaseAction { tournoiPhaseId :: !(Id TournoiPhase) }
    | UpdateTournoiPhaseAction { tournoiPhaseId :: !(Id TournoiPhase) }
    | DeleteTournoiPhaseAction { tournoiPhaseId :: !(Id TournoiPhase) }
    deriving (Eq, Show, Data)

data TournoiBranchesController
    = TournoiBranchesAction
    | NewTournoiBranchAction
    | ShowTournoiBranchAction { tournoiBranchId :: !(Id TournoiBranch) }
    | CreateTournoiBranchAction
    | EditTournoiBranchAction { tournoiBranchId :: !(Id TournoiBranch) }
    | UpdateTournoiBranchAction { tournoiBranchId :: !(Id TournoiBranch) }
    | DeleteTournoiBranchAction { tournoiBranchId :: !(Id TournoiBranch) }
    deriving (Eq, Show, Data)

data TournoiPoulesController
    = TournoiPoulesAction
    | NewTournoiPouleAction
    | ShowTournoiPouleAction { tournoiPouleId :: !(Id TournoiPoule) }
    | CreateTournoiPouleAction
    | EditTournoiPouleAction { tournoiPouleId :: !(Id TournoiPoule) }
    | UpdateTournoiPouleAction { tournoiPouleId :: !(Id TournoiPoule) }
    | DeleteTournoiPouleAction { tournoiPouleId :: !(Id TournoiPoule) }
    deriving (Eq, Show, Data)

data GymnasesController
    = GymnasesAction
    | NewGymnaseAction
    | ShowGymnaseAction { gymnaseId :: !(Id Gymnase) }
    | CreateGymnaseAction
    | EditGymnaseAction { gymnaseId :: !(Id Gymnase) }
    | UpdateGymnaseAction { gymnaseId :: !(Id Gymnase) }
    | DeleteGymnaseAction { gymnaseId :: !(Id Gymnase) }
    deriving (Eq, Show, Data)

data PouleEquipesController
    = PouleEquipesAction
    | NewPouleEquipeAction
    | ShowPouleEquipeAction { pouleEquipeId :: !(Id PouleEquipe) }
    | CreatePouleEquipeAction
    | EditPouleEquipeAction { pouleEquipeId :: !(Id PouleEquipe) }
    | UpdatePouleEquipeAction { pouleEquipeId :: !(Id PouleEquipe) }
    | DeletePouleEquipeAction { pouleEquipeId :: !(Id PouleEquipe) }
    deriving (Eq, Show, Data)

data PouleMatchsController
    = PouleMatchsAction
    | NewPouleMatchAction
    | ShowPouleMatchAction { pouleMatchId :: !(Id PouleMatch) }
    | CreatePouleMatchAction
    | EditPouleMatchAction { pouleMatchId :: !(Id PouleMatch) }
    | UpdatePouleMatchAction { pouleMatchId :: !(Id PouleMatch) }
    | DeletePouleMatchAction { pouleMatchId :: !(Id PouleMatch) }
    deriving (Eq, Show, Data)

data TerrainsController
    = TerrainsAction
    | NewTerrainAction
    | ShowTerrainAction { terrainId :: !(Id Terrain) }
    | CreateTerrainAction
    | EditTerrainAction { terrainId :: !(Id Terrain) }
    | UpdateTerrainAction { terrainId :: !(Id Terrain) }
    | DeleteTerrainAction { terrainId :: !(Id Terrain) }
    deriving (Eq, Show, Data)

data MatchsController
    = MatchsAction
    | NewMatchAction
    | ShowMatchAction { matchId :: !(Id Match) }
    | CreateMatchAction
    | EditMatchAction { matchId :: !(Id Match) }
    | UpdateMatchAction { matchId :: !(Id Match) }
    | DeleteMatchAction { matchId :: !(Id Match) }
    deriving (Eq, Show, Data)

data MatchSetsController
    = MatchSetsAction
    | NewMatchSetAction
    | ShowMatchSetAction { matchSetId :: !(Id MatchSet) }
    | CreateMatchSetAction
    | EditMatchSetAction { matchSetId :: !(Id MatchSet) }
    | UpdateMatchSetAction { matchSetId :: !(Id MatchSet) }
    | DeleteMatchSetAction { matchSetId :: !(Id MatchSet) }
    deriving (Eq, Show, Data)
