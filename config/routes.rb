Rails.application.routes.draw do
  root :to => 'links#index'
  resources :links do
    resources :comments, except: [:new, :show, :edit, :update]
  end

  match('/links/:id/vote', {:via => [:patch, :put], :to => 'votes#update', as: :vote})
end

#       root GET       /                                      links#index
# link_comments GET       /links/:link_id/comments(.:format)     comments#index
#               POST      /links/:link_id/comments(.:format)     comments#create
#  link_comment DELETE    /links/:link_id/comments/:id(.:format) comments#destroy
#         links GET       /links(.:format)                       links#index
#               POST      /links(.:format)                       links#create
#      new_link GET       /links/new(.:format)                   links#new
#     edit_link GET       /links/:id/edit(.:format)              links#edit
#          link GET       /links/:id(.:format)                   links#show
#               PATCH     /links/:id(.:format)                   links#update
#               PUT       /links/:id(.:format)                   links#update
#               DELETE    /links/:id(.:format)                   links#destroy
#               PATCH|PUT /links/:id/vote(.:format)              votes#update
