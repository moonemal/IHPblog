module Web.View.Users.Index where
import Web.View.Prelude

data IndexView = IndexView { users :: [User]  }

instance View IndexView where
    html IndexView { .. } = [hsx|
        {breadcrumb}

        <h1>Index<a href={pathTo NewUserAction} class="btn btn-primary ms-4">Sign up</a></h1>
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th>USERS</th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>{forEach users renderUser}</tbody>
            </table>
            
        </div>
    |]
        where
            breadcrumb = renderBreadcrumb
                [ breadcrumbLink "Go to login" NewSessionAction
                ]

renderUser :: User -> Html
renderUser user = [hsx|
    
|]