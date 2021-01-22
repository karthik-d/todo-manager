Rails.application.routes.draw do
  resources :todos
  resources :users
  post "users/login", to: "users#login"
end

# <HTTP Method> <url>, to:"<class>#<method>"
# <class> is actually ClassController. Eg: student => StudentController
