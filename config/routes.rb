Rails.application.routes.draw do
  root to: 'pages#home'

  get 'which-cat', to: 'pages#cat'
end
