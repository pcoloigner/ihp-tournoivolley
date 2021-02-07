module Admin.FrontController where

import IHP.RouterPrelude
import Admin.Controller.Prelude
import Admin.View.Layout (defaultLayout)

-- Controller Imports
import Admin.Controller.MatchSets
import Admin.Controller.Matchs
import Admin.Controller.Terrains
import Admin.Controller.PouleMatchs
import Admin.Controller.PouleEquipes
import Admin.Controller.Gymnases
import Admin.Controller.TournoiPoules
import Admin.Controller.TournoiBranches
import Admin.Controller.TournoiPhases
import Admin.Controller.Equipes
import Admin.Controller.Personnes
import Admin.Controller.Tournois
import Admin.Controller.Clubs
import Admin.Controller.Static

instance FrontController AdminApplication where
    controllers = 
        [ startPage WelcomeAction
        -- Generator Marker
        , parseRoute @MatchSetsController
        , parseRoute @MatchsController
        , parseRoute @TerrainsController
        , parseRoute @PouleMatchsController
        , parseRoute @PouleEquipesController
        , parseRoute @GymnasesController
        , parseRoute @TournoiPoulesController
        , parseRoute @TournoiBranchesController
        , parseRoute @TournoiPhasesController
        , parseRoute @EquipesController
        , parseRoute @PersonnesController
        , parseRoute @TournoisController
        , parseRoute @ClubsController
        ]

instance InitControllerContext AdminApplication where
    initContext = do
        setLayout defaultLayout
