module Admin.View.Layout (defaultLayout, Html) where

import IHP.ViewPrelude
import IHP.Environment
import qualified Text.Blaze.Html5            as H
import qualified Text.Blaze.Html5.Attributes as A
import Generated.Types
import IHP.Controller.RequestContext
import Admin.Types
import Admin.Routes

defaultLayout :: Html -> Html
defaultLayout inner = H.docTypeHtml ! A.lang "en" $ [hsx|
<head>
    {metaTags}

    {stylesheets}
    {scripts}

    <title>App</title>
</head>
<body>
    {navbar}    
    <div class="container mt-4">
        {renderFlashMessages}
        {inner}
    </div>
</body>
|]


navbar :: Html
navbar = [hsx|
<nav class="navbar navbar-light bg-light navbar-expand-lg">
    <a class="navbar-brand" href="/">Menu Admin</a>
    <ul class="navbar-nav mr-auto">
        <li class="nav-item">
           <a class="nav-link" href={ClubsAction}>Clubs</a>
           <!-- Clubs -->
        </li>
    <!-- 
       <li class="nav-item">
        <a class="nav-link" href={TournoisAction}>Tournois</a>
        </li>
        <li class="nav-item">
        <a class="nav-link" href={GymnasesAction}>Gymnases</a>
        </li>
        <li class="nav-item">
        <a class="nav-link" href={EquipesAction}>Equipes</a>
        </li>
        <li class="nav-item">
        <a class="nav-link" href={PersonnesAction}>Personnes</a>
        </li>
        <li class="nav-item">
        <a class="nav-link" href={MatchsAction}>Matchs</a>
        </li>
        <li class="nav-item">
        <a class="nav-link" href={TerrainsAction}>Terrains</a>
        </li>
        <li class="nav-item">
        <a class="nav-link" href={PouleEquipesAction}>Equipes de Poules</a>
        </li>
        <li class="nav-item">
        <a class="nav-link" href={PouleMatchsAction}>Matchs de Poule</a>
        </li>
        -->
    </ul>
</nav>
|]


stylesheets :: Html
stylesheets = do
    when isDevelopment [hsx|
        <link rel="stylesheet" href="/vendor/bootstrap.min.css"/>
        <link rel="stylesheet" href="/vendor/flatpickr.min.css"/>
        <link rel="stylesheet" href="/app.css"/>
    |]
    when isProduction [hsx|
        <link rel="stylesheet" href="/prod.css"/>
    |]

scripts :: Html
scripts = do
    when isDevelopment [hsx|
        <script id="livereload-script" src="/livereload.js"></script>
        <script src="/vendor/jquery-3.2.1.slim.min.js"></script>
        <script src="/vendor/timeago.js"></script>
        <script src="/vendor/popper.min.js"></script>
        <script src="/vendor/bootstrap.min.js"></script>
        <script src="/vendor/flatpickr.js"></script>
        <script src="/helpers.js"></script>
        <script src="/vendor/morphdom-umd.min.js"></script>
    |]
    when isProduction [hsx|
        <script src="/prod.js"></script>
    |]


metaTags :: Html
metaTags = [hsx|
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta property="og:title" content="App"/>
    <meta property="og:type" content="website"/>
    <meta property="og:url" content="TODO"/>
    <meta property="og:description" content="TODO"/>
|]
