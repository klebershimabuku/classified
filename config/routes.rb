Classified::Application.routes.draw do
  resources :posts do
    collection do
      get :pendings
      get :new_post_successful, :as => 'new_post_successful'
    end
    member do
      get :approve
      get :reject_to_review
      get :expire 
    end
  end

  devise_for :users, :path_prefix => 'd', :controllers => { :registrations => "registrations" }, :path_names => { 
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

  match '/sign-up-successful', :to => 'pages#successfulsignup', :as => 'user_registration_successfull'
  match '/tos', :to => 'pages#tos', :as => 'tos'
  match '/search/advanced', :to => 'posts#advanced_search', :as => 'advanced_search'
  match '/search', :to => 'posts#search', :as => 'search'  
  match '/contact', :to => 'pages#contact', :as => 'contact'
  match '/home', :to => 'pages#home'
  root :to => 'pages#welcome'
end
