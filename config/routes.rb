Thevideofeed::Application.routes.draw do
  root :to => 'videos#index'

  resources :people, only: :show
  resources :videos, only: :index

  resources :subscribers, only: :create
  get 'unsubscribe/:key', to: 'subscribers#destroy', as: :unsubscribe, key: /.*/
  get 'subscribe/daily/:key', to: 'subscribers#daily', as: :subscribe_daily, key: /.*/
  get 'subscribe/weekly/:key', to: 'subscribers#weekly', as: :subscribe_weekly, key: /.*/
end
