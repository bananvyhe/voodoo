Rails.application.routes.draw do
	root to: 'welcome#index'
	resources :news do
    post :news, to: "news#create"
  end
  # get 'welcome/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
