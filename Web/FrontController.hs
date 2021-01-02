module Web.FrontController where

import IHP.RouterPrelude
import Web.Controller.Prelude
import Web.View.Layout (defaultLayout)

-- Controller Imports
import Web.Controller.Terrains
import Web.Controller.PouleMatchs
import Web.Controller.PouleEquipes
import Web.Controller.Gymnases
import Web.Controller.TournoiPoules
import Web.Controller.TournoiBranches
import Web.Controller.TournoiPhases
import Web.Controller.Equipes
import Web.Controller.Personnes
import Web.Controller.Tournois
import Web.Controller.Clubs
import Web.Controller.Static

instance FrontController WebApplication where
    controllers = 
        [ startPage WelcomeAction
        -- Generator Marker
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

instance InitControllerContext WebApplication where
    initContext = do
        setLayout defaultLayout
