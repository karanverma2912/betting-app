Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :sports, only: [:index, :show] do
        resources :matches, only: [:index, :show]
      end
      resources :matches, only: [] do
        resources :bets, only: [:create]
      end
      post "matches/:match_id/settle", to: "settlements#create"
    end
  end
end
