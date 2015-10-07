Rails.application.routes.draw do
  resources :gateway_stats
  get 'time/gmt'

  get 'time/timezone'

  resources :config_files
  resources :tasks
  get 'features/time'

  get 'features/last_record'

  get 'tags/', to: 'tags#index'
  get 'tags/:id', to: 'tags#show'

  resources :tag_types
  get 'landings/index'
  get 'audits', to: 'audits#index'

  resources :firmwares
  resources :permissions
  resources :roles

  resources :lamp_stats, only: :create
  resources :lamps, shallow: true do
    get '/600milluminarias', to: 'features#last_record', format: :json
    resources :lamp_stats, only: [:index, :show]
  end
  resources :gateways
  resources :products
  resources :companies

  resources :networks, shallow: true do
    resources :nodes
  end

  devise_for :users, controllers: {registrations: "users/registrations", sessions: "users/sessions", passwords: "users/passwords"}, skip: [:sessions, :registrations]
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'landings#index'

  devise_scope :user do
    get    "login"   => "users/sessions#new",         as: :new_user_session
    post   "login"   => "users/sessions#create",      as: :user_session
    get "/signout" => "users/sessions#destroy",     as: :destroy_user_session

    get    "signup"  => "users/registrations#new",    as: :new_user_registration
    post   "signup"  => "users/registrations#create", as: :user_registration
    put    "signup"  => "users/registrations#update", as: :update_user_registration
    get    "account" => "users/registrations#edit",   as: :edit_user_registration
  end

end
