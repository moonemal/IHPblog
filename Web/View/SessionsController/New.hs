module Web.View.SessionsController.New where
import Web.View.Prelude

data NewView = NewView { sessionsController :: SessionsController }

instance View NewView where
    html NewView { .. } = [hsx|
        {breadcrumb}
        <h1>New SessionsController</h1>
        {renderForm sessionsController}
    |]
        where
            breadcrumb = renderBreadcrumb
                [ breadcrumbLink "SessionsControllers" SessionsControllersAction
                , breadcrumbText "New SessionsController"
                ]

renderForm :: SessionsController -> Html
renderForm sessionsController = formFor sessionsController [hsx|
    
    {submitButton}

|]