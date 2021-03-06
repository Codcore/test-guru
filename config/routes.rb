Rails.application.routes.draw do

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }
  root 'tests#index'

  resources :feedbacks, shallow: true, only: %i[new create]
  resources :tests, shallow: true, only: :index do
    member do
      post :start
    end
  end

  resources :badges, only: %i[index show]

  resources :test_passages, only: %i[show update] do
    member do
      get :result
      post :gist
    end
  end

  namespace :admin do
    resources :gists, only: %i[index]
    resources :badges, except: :show
    resources :tests, shallow: true do
      patch :update_inline, on: :member

      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end
  end
end
