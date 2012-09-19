Thevideofeed::Application.routes.draw do
  root :to => 'videos#index'
  resources :subscribers
  
  # This route should be last
  match '/:username' => "people#show"
  
end
