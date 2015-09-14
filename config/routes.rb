Rails.application.routes.draw do

  root to: "landing#landing"

  # User Routes
  get "/signup", to: "users#new"
  get "/profile", to: "users#show"
  resources :users

  # Session Routes
  get "/login", to: "sessions#new"
  get "/logout", to: "sessions#destroy"
  resources :sessions, only: [:create]
  # post "/sessions", to: "sessions#create"

  # Stories Routes
  resources :stories
  # CJ: I think this is repetitive, since you have a `delete` route
  # for `stories` when you use `resources :stories`
  delete "/stories", to: "stories#destroy"
  # get "/profile", to: "users#show"
  # match "/stories/:id/draft" => "stories#draft", :as => :stories_draft, via: :all # stories_draft(story.id)
  get "/stories/:id/draft", to: "stories#draft", as: :stories_draft
  put "/stories/:id/draft/pictures", to: "stories#draft", as: :stories_draft_pictures
  # Pictures
  resources :pictures

end

#       Prefix Verb   URI Pattern                  Controller#Action
#         root GET    /                            landing#landing
#       signup GET    /signup(.:format)            users#new
#      profile GET    /profile(.:format)           users#show
#        users GET    /users(.:format)             users#index
#              POST   /users(.:format)             users#create
#     new_user GET    /users/new(.:format)         users#new
#    edit_user GET    /users/:id/edit(.:format)    users#edit
#         user GET    /users/:id(.:format)         users#show
#              PATCH  /users/:id(.:format)         users#update
#              PUT    /users/:id(.:format)         users#update
#              DELETE /users/:id(.:format)         users#destroy
#        login GET    /login(.:format)             sessions#new
#       logout GET    /logout(.:format)            sessions#destroy
#     sessions POST   /sessions(.:format)          sessions#create
#      stories GET    /stories(.:format)           stories#index
#              POST   /stories(.:format)           stories#create
#    new_story GET    /stories/new(.:format)       stories#new
#   edit_story GET    /stories/:id/edit(.:format)  stories#edit
#        story GET    /stories/:id(.:format)       stories#show
#              PATCH  /stories/:id(.:format)       stories#update
#              PUT    /stories/:id(.:format)       stories#update
#              DELETE /stories/:id(.:format)       stories#destroy
#              DELETE /stories(.:format)           stories#destroy
#     pictures GET    /pictures(.:format)          pictures#index
#              POST   /pictures(.:format)          pictures#create
#  new_picture GET    /pictures/new(.:format)      pictures#new
# edit_picture GET    /pictures/:id/edit(.:format) pictures#edit
#      picture GET    /pictures/:id(.:format)      pictures#show
#              PATCH  /pictures/:id(.:format)      pictures#update
#              PUT    /pictures/:id(.:format)      pictures#update
#              DELETE /pictures/:id(.:format)      pictures#destroy