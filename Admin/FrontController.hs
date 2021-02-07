module Admin.FrontController where

import IHP.RouterPrelude
import Admin.Controller.Prelude
import Admin.View.Layout (defaultLayout)

-- Controller Imports
import Admin.Controller.Static
import Admin.Controller.Clubs

instance FrontController AdminApplication where
    controllers = 
        [ startPage WelcomeAction
        -- Generator Marker
        , parseRoute @ClubsController
        ]

instance InitControllerContext AdminApplication where
    initContext = do
        setLayout defaultLayout
