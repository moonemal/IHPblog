module Web.View.Posts.New where
import Web.View.Prelude
data ShowView = ShowView { post :: Post }
data NewView = NewView { post :: Post }

instance View NewView where
    html NewView { .. } = [hsx|
        {breadcrumb}
        <h1>New Post</h1>
        {renderForm post}
    |]
        where
            breadcrumb = renderBreadcrumb
                [ breadcrumbLink "Posts" PostsAction
                , breadcrumbText "New Post"
                ]
instance View ShowView where
    html ShowView { .. } = [hsx|
     <form method="POST" action={upvotePath}>
            <button>Upvote</button>
        </form>
    |]
        where
            upvotePath = pathTo $ UpvotePostAction (get #id post)
renderForm :: Post -> Html
renderForm post = formFor post [hsx|
    {(textField #title)}
    {(textareaField #body) { helpText = "You can use Markdown here"} }
    {submitButton}

|]