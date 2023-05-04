module Web.View.Posts.Show where
import Web.View.Prelude
import qualified Text.MMark as MMark

data ShowView = ShowView { post :: Post }

instance View ShowView where
    html ShowView { .. } = [hsx|
        {breadcrumb}
        <h1>{post.title}</h1>
        <div>{post.createdAt}</div>
        <div>{post.body}</div>
        <div><a href={NewCommentAction post.id}>NewComment</a></div>


    |]
        where
            breadcrumb = renderBreadcrumb
                            [ breadcrumbLink "Posts" PostsAction
                            , breadcrumbText "Show Post"
                            ]
                        
renderMarkdown text =
    case text |> MMark.parse "" of
        Left error -> "Something went wrong"
        Right markdown -> MMark.render markdown |> tshow |> preEscapedToHtml