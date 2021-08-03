Rails.application.routes.draw do
  devise_for :students, controllers: { confirmations: 'confirmations' }
  get 'students', to: "students#index"

  root to: "pages#index"
end
