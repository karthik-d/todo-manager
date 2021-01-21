Rails.application.routes.draw do
  get "todos", to: "todos#index"
end

# <HTTP Method> <url>, to:"<class>#<method>"
# <class> is actually ClassController. Eg: student => StudentController
