Partiude::Application.routes.draw do
  devise_for :users, :path_names => { :sign_in => 'login',
                                      :sign_out => 'logout',
                                      :password => 'recover_password' }

  root :to => 'index#index'

  resources :itineraries, :except => :edit
  resources :users, :only => :show
end
