Rails.application.routes.draw do
  devise_for :students
  get 'students', to: "students#index"

  root to: "pages#index"
end
