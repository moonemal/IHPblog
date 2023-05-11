module Web.Controller.SessionsController where

import Web.Controller.Prelude
import Web.View.SessionsController.Index
import Web.View.SessionsController.New
import Web.View.SessionsController.Edit
import Web.View.SessionsController.Show

instance Controller SessionsControllerController where
    action SessionsControllersAction = do
        sessionsController <- query @SessionsController |> fetch
        render IndexView { .. }

    action NewSessionsControllerAction = do
        let sessionsController = newRecord
        render NewView { .. }

    action ShowSessionsControllerAction { sessionsControllerId } = do
        sessionsController <- fetch sessionsControllerId
        render ShowView { .. }

    action EditSessionsControllerAction { sessionsControllerId } = do
        sessionsController <- fetch sessionsControllerId
        render EditView { .. }

    action UpdateSessionsControllerAction { sessionsControllerId } = do
        sessionsController <- fetch sessionsControllerId
        sessionsController
            |> buildSessionsController
            |> ifValid \case
                Left sessionsController -> render EditView { .. }
                Right sessionsController -> do
                    sessionsController <- sessionsController |> updateRecord
                    setSuccessMessage "SessionsController updated"
                    redirectTo EditSessionsControllerAction { .. }

    action CreateSessionsControllerAction = do
        let sessionsController = newRecord @SessionsController
        sessionsController
            |> buildSessionsController
            |> ifValid \case
                Left sessionsController -> render NewView { .. } 
                Right sessionsController -> do
                    sessionsController <- sessionsController |> createRecord
                    setSuccessMessage "SessionsController created"
                    redirectTo SessionsControllersAction

    action DeleteSessionsControllerAction { sessionsControllerId } = do
        sessionsController <- fetch sessionsControllerId
        deleteRecord sessionsController
        setSuccessMessage "SessionsController deleted"
        redirectTo SessionsControllersAction

buildSessionsController sessionsController = sessionsController
    |> fill @'[]
