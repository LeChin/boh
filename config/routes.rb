Rails.application.routes.draw do

  namespace :admin do
    resources :recipes
  end
  # mount Fae below your admin namespec
  mount Fae::Engine => '/admin'

  root :to => 'pages#home'

end
