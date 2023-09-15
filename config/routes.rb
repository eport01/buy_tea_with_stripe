Rails.application.routes.draw do
  resources :teas
  root "teas#index"
end
