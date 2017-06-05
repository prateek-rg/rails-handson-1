Rails.application.routes.draw do
  get 'comments/index'

  get 'comments/show'

  get 'comments/new'

  get 'comments/create'

  get 'comments/update'

  get 'comments/destroy'

  root to: 'welcome#index'
  get 'welcome/index'
  resources :articles do
	resources :comments
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
