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

  devise_for :users, :path_prefix => 'd', :path_names => { 
                                            :sign_up => "register", 
                                            :sign_in => "login", 
                                            :sign_out => "logout" 
                                          }

  resources :users do
    member do
      get :turns_manager
      get :turns_moderator
      get :turns_user
    end
  end

  match '/home', :to => 'pages#home'
  root :to => 'pages#welcome'
end
