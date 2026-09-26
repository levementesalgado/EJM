Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :diretorias, only: [:index, :show, :create, :update, :destroy]
      resources :colaboradores, only: [:index, :show, :create, :update, :destroy]
      resources :clientes, only: [:index, :show, :create, :update, :destroy]
      resources :projetos do
        member do
          patch :aprovar
          patch :reprovar
          post :alocar_prestador
        end
        resources :contratos, only: [:index, :show, :create, :update]
        resources :financeiros, only: [:index, :show, :create, :update]
      end
      resources :area_atuacoes, only: [:index, :show, :create, :update, :destroy]
      resources :prospeccoes do
        member do
          post :analisar
        end
      end
      resources :prestador_servicos, only: [:index, :show, :create, :update, :destroy]

      post 'auth/login', to: 'auth#login'
      post 'auth/criar_conta', to: 'auth#criar_conta'
    end
  end

  get "up" => "rails/health#show", as: :rails_health_check
end
