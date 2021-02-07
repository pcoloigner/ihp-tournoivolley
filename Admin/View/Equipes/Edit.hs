module Admin.View.Equipes.Edit where
import Admin.View.Prelude

data EditView = EditView { equipe :: Equipe }

instance View EditView where
    html EditView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={EquipesAction}>Equipes</a></li>
                <li class="breadcrumb-item active">Edit Equipe</li>
            </ol>
        </nav>
        <h1>Edit Equipe</h1>
        {renderForm equipe}
    |]

renderForm :: Equipe -> Html
renderForm equipe = formFor equipe [hsx|
    {(textField #nom)}
    {(textField #niveau)}
    {(textField #tournoiId)}
    {submitButton}
|]
