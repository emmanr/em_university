Rails.application.routes.draw do
  devise_for :students, controllers: { confirmations: 'confirmations' }
  get 'students', to: "students#index"

  devise_scope :student do
    authenticated do
      root to: 'courses#index'
    end
    unauthenticated do
      root to: "pages#index", as: :unauthenticated_root
    end
  end
end
