Rails.application.routes.draw do
	root to: 'welcome#index'
	 
    post :news, to: "news#create"
    get :news, to: "news#index"
 		 
  # get 'welcome/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
