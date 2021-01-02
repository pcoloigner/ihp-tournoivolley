module Web.View.Gymnases.Show where
import Web.View.Prelude

data ShowView = ShowView { gymnase :: Gymnase }

instance View ShowView where
    html ShowView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={GymnasesAction}>Gymnases</a></li>
                <li class="breadcrumb-item active">Show Gymnase</li>
            </ol>
        </nav>
        <h1>Show Gymnase</h1>
        <p>{gymnase}</p>
    |]
