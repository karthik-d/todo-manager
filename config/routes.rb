Rails.application.routes.draw do
  get "/", to: "home#index", as: :root

  resources :todos
  resources :users

  get "/login", to: "sessions#new", as: :new_session
  post "/login", to: "sessions#create", as: :login_auth
end

# <HTTP Method> <url>, to:"<class>#<method>"
# <class> is actually ClassController. Eg: student => StudentController
