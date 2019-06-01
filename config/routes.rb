Rails.application.routes.draw do
  get 'contacts/create'
  get 'contacts/destroy'
  get 'invitations/create'
  get 'invitations/destroy'
	resources :users, only: [:show, :update, :destroy, :create] do
		resources :tags	
	end
	
	get 'register' => 'users#new'
	
	resources :companies do
		resources :workers
		resources :tags
		resources :invitations, :only => [:create, :destroy]
		resources :contacts, :only => [:create, :destroy]
	end
	
	delete "/companies/:company_id/invitations/:user_id/accept" => "invitations#accept"
	delete "/companies/:company_id/invitations/:user_id/reject" => "invitations#reject"


	get '/login' => 'sessions#new'	
	post '/login' => 'sessions#create'
	delete '/logout' => 'sessions#destroy'

	root 'login#index'
end
