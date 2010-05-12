ActionController::Routing::Routes.draw do |map|
  map.root :controller => "recipes"
  map.resources :recipes
end
