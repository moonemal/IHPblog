module Web.View.SessionsController.Show where
import Web.View.Prelude

data ShowView = ShowView { sessionsController :: SessionsController }

instance View ShowView where
    html ShowView { .. } = [hsx|
        {breadcrumb}
        <h1>Show SessionsController</h1>
        <p>{sessionsController}</p>

    |]
        where
            breadcrumb = renderBreadcrumb
                            [ breadcrumbLink "SessionsControllers" SessionsControllersAction
                            , breadcrumbText "Show SessionsController"
                            ]