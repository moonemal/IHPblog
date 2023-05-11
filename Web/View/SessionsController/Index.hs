module Web.View.SessionsController.Index where
import Web.View.Prelude

data IndexView = IndexView { sessionsController :: [SessionsController]  }

instance View IndexView where
    html IndexView { .. } = [hsx|
        {breadcrumb}

        <h1>Index<a href={pathTo NewSessionsControllerAction} class="btn btn-primary ms-4">+ New</a></h1>
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th>SessionsController</th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>{forEach sessionsController renderSessionsController}</tbody>
            </table>
            
        </div>
    |]
        where
            breadcrumb = renderBreadcrumb
                [ breadcrumbLink "SessionsControllers" SessionsControllersAction
                ]

renderSessionsController :: SessionsController -> Html
renderSessionsController sessionsController = [hsx|
    <tr>
        <td>{sessionsController}</td>
        <td><a href={ShowSessionsControllerAction sessionsController.id}>Show</a></td>
        <td><a href={EditSessionsControllerAction sessionsController.id} class="text-muted">Edit</a></td>
        <td><a href={DeleteSessionsControllerAction sessionsController.id} class="js-delete text-muted">Delete</a></td>
    </tr>
|]