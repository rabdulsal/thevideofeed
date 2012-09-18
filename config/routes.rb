Thevideofeed::Application.routes.draw do
  root :to => 'videos#index'
  match '/:username' => "people#show"
end
