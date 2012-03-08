Classified::Application.routes.draw do
  resources :posts

  devise_for :users, :path_names => { :sign_up => "register", :sign_in => "login", :sign_out => "logout" } 
  root :to => 'pages#home'
end
