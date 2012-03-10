Classified::Application.routes.draw do
  resources :posts do
    collection do
      get :pendings
    end
    member do
      get :approve
      get :reject_to_review
      get :expire 
    end
  end
  devise_for :users, :path_names => { :sign_up => "register", :sign_in => "login", :sign_out => "logout" } 
  match '/home', :to => 'pages#home'
  root :to => 'pages#welcome'
end
