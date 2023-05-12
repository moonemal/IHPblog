module Web.FrontController where

import IHP.RouterPrelude
import IHP.LoginSupport.Middleware
import Web.Controller.Prelude
import Web.View.Layout (defaultLayout)

-- Controller Imports
import Web.Controller.Users

--import Web.Controller.Reaction
import Web.Controller.Comments
import Web.Controller.Posts

import Web.Controller.Static

instance FrontController WebApplication where
    controllers = 
        [ startPage WelcomeAction
        -- Generator Marker
        , parseRoute @UsersController
 --       , parseRoute @ReactionController
        , parseRoute @CommentsController
        , parseRoute @PostsController
        , parseRoute @UsersController
        
 
        ]

instance InitControllerContext WebApplication where
    initContext = do
        setLayout defaultLayout
        initAutoRefresh
        initAuthentication @User
