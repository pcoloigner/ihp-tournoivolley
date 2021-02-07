module Admin.View.Equipes.New where
import Admin.View.Prelude

data NewView = NewView { equipe :: Equipe }

instance View NewView where
    html NewView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={EquipesAction}>Equipes</a></li>
                <li class="breadcrumb-item active">New Equipe</li>
            </ol>
        </nav>
        <h1>New Equipe</h1>
        {renderForm equipe}
    |]

renderForm :: Equipe -> Html
renderForm equipe = formFor equipe [hsx|
    {(textField #nom)}
    {(textField #niveau)}
    {(textField #tournoiId)}
    {submitButton}
|]
