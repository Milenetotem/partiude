Partiude::Application.routes.draw do
  root :to => 'index#index'

  devise_for :users, :path_names => { :sign_in => 'login',
                                      :sign_out => 'logout',
                                      :password => 'recover_password' }

  resources :itineraries, :except => :edit do
    get "search", :on => :collection
    post "join", :member
  end
  resources :users, :only => :show
end
