module Web.View.SessionsController.Edit where
import Web.View.Prelude

data EditView = EditView { sessionsController :: SessionsController }

instance View EditView where
    html EditView { .. } = [hsx|
        {breadcrumb}
        <h1>Edit SessionsController</h1>
        {renderForm sessionsController}
    |]
        where
            breadcrumb = renderBreadcrumb
                [ breadcrumbLink "SessionsControllers" SessionsControllersAction
                , breadcrumbText "Edit SessionsController"
                ]

renderForm :: SessionsController -> Html
renderForm sessionsController = formFor sessionsController [hsx|
    
    {submitButton}

|]