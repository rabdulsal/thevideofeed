Thevideofeed::Application.routes.draw do
  root :to => 'videos#index'

  resources :subscribers, only: :create
  get 'unsubscribe/:key', to: 'subscribers#destroy', as: :unsubscribe, key: /.*/

  # This route should be last
  match '/:id' => "people#show"
end
