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
