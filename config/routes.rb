# coding: UTF-8

CaptureTheFlag::Application.routes.draw do
  root to: 'games#index'

  resources :games do
    member do
      post :add_user, :remove_user
      get :start_game, :end_game # for testing only
      post :start_game, :end_game
    end
  end
  resources :registrations
  resources :users do
    member do
      get :pick_up_flag, :drop_flag # for testing only
      post :pick_up_flag, :drop_flag
      post :update_location
    end
  end
end
