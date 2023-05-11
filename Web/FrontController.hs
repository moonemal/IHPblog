module Web.FrontController where

import IHP.RouterPrelude
import IHP.LoginSupport.Middleware
import Web.Controller.Sessions
import Web.Controller.Prelude
import Web.View.Layout (defaultLayout)

-- Controller Imports
import Web.Controller.SessionsController
--import Web.Controller.Reaction
import Web.Controller.Comments
import Web.Controller.Posts

import Web.Controller.Static

instance FrontController WebApplication where
    controllers = 
        [ startPage WelcomeAction
        -- Generator Marker
 --       , parseRoute @ReactionController
        , parseRoute @SessionsController
        , parseRoute @CommentsController
        , parseRoute @PostsController
        
 
        ]

instance InitControllerContext WebApplication where
    initContext = do
        setLayout defaultLayout
        initAutoRefresh
        initAuthentication @User
