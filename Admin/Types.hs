module Admin.Types where

import IHP.Prelude
import IHP.ModelSupport
import Generated.Types

data AdminApplication = AdminApplication deriving (Eq, Show)


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

