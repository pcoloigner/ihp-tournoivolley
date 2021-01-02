module Web.FrontController where

import IHP.RouterPrelude
import Web.Controller.Prelude
import Web.View.Layout (defaultLayout)

-- Controller Imports
import Web.Controller.Personnes
import Web.Controller.Tournois
import Web.Controller.Clubs
import Web.Controller.Static

instance FrontController WebApplication where
    controllers = 
        [ startPage WelcomeAction
        -- Generator Marker
        , parseRoute @PersonnesController
        , parseRoute @TournoisController
        , parseRoute @ClubsController
        ]

instance InitControllerContext WebApplication where
    initContext = do
        setLayout defaultLayout
