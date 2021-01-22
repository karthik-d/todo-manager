Rails.application.routes.draw do
  resources :todos
  resources :users
end

# <HTTP Method> <url>, to:"<class>#<method>"
# <class> is actually ClassController. Eg: student => StudentController
