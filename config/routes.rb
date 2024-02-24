Rails.application.routes.draw do
  devise_for :users
  root "home#index"
  resources :employees
  resources :documents
  # custom_routes
  get 'about' => "pages#about_us"
  get 'contact'=> "pages#contact_us"
  get 'privacy-policy' => "pages#privacy_policy"
  get "terms-and-conditions" => "pages#terms_and_conditions"
end
