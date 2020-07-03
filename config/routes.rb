Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }

  devise_scope :user do
    get 'users/thanks', to: 'users/registrations#thanks'

    def devise_scope(scope)
      constraint = lambda do |request|
        request.env["devise.mapping"] = Devise.maapings[scope]
        true
      end
      constraints(constraint) do
        yield
      end
    end
  end

  devise_scope :user do
    get 'sign_in', to: "users/sessions#new"
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "questions#index"
  resources :questions, only: [:index]
  resources :users, only: [:show, :edit, :update] do
    resources :questions, only: [:new, :create]
  end
  

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
