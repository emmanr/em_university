Rails.application.routes.draw do
  devise_for :students, controllers: {
    confirmations: 'students/confirmations',
    omniauth_callbacks: 'students/omniauth_callbacks'
  }

  resources :students, only: [:index, :show, :destroy] do
    member do
      patch :ban
    end
  end

  devise_scope :student do
    authenticated do
      root to: 'students#index'
    end
    unauthenticated do
      root to: "pages#index", as: :unauthenticated_root
    end
  end
end
