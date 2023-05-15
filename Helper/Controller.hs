module Application.Helper.Controller (
    module IHP.LoginSupport.Helper.Controller
) where
--import IHP.ControllerPrelude

-- Here we can add functions which are available in all our controllers
import IHP.LoginSupport.Helper.Controller
import Generated.Types

type instance CurrentUserRecord = User