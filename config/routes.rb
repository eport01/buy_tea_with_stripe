Rails.application.routes.draw do
  resources :teas
  root "teas#index"

  resources :purchases

  post "payment-intent", to: "purchases#intent"
end
