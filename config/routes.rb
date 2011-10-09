Facebootstrap::Application.routes.draw do

  # /canvas/tab -> page_id routing
  # /canvas/tab/app_id -> page_app_id routing

  # /pages/[page_id]/tabs
  # /pages/[page_id]/tabs/[tab_name]/edit,updte, etc...
  # /page_apps/[page_app_id]/tabs/[tab_name]/edit,update, etc...

  resources :pages
  resources :page_apps

  devise_for :users, controllers: {
      omniauth_callbacks: "users/omniauth_callbacks",
      sessions: 'users/sessions'
  }
  resources :users

  match 'management/deauthorize' => 'management#deauthorize', as: 'deauthorize'
  match 'management/register_auth_token' => 'management#register_auth_token', as: 'register_auth_token'

  match 'canvas' => 'canvas#index', as: 'canvas'
  match 'canvas/tab/:app_id' => 'canvas#tab', as: 'tab'

end
