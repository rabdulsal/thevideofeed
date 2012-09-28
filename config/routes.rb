Thevideofeed::Application.routes.draw do
  root :to => 'videos#index'
  resources :subscribers, only: :create

  # This route should be last
  match '/:username' => "people#show"
end
