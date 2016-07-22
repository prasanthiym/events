Events::Application.routes.draw do

   root 'events#index'
   
   resources :events
   
   post '/create-events' => 'api#create_events'
   post '/create-events-rss' => 'api#create_events_rss'
  
end
