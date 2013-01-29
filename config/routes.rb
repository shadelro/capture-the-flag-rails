CaptureTheFlag::Application.routes.draw do
  root to: 'games#index'

  resources :games do
    member do
      post :add_user, :remove_user
    end
  end
  resources :registrations
  resources :users
  
end
