Rails.application.routes.draw do
  root :to => 'links#index'
  resources :links do
    resources :comments, except: [:new, :show, :edit, :update]
  end
end

#            Prefix Verb   URI Pattern                                 Controller#Action
#              root GET    /                                           links#index
#     link_comments GET    /links/:link_id/comments(.:format)          comments#index
#                   POST   /links/:link_id/comments(.:format)          comments#create
#  new_link_comment GET    /links/:link_id/comments/new(.:format)      comments#new
# edit_link_comment GET    /links/:link_id/comments/:id/edit(.:format) comments#edit
#      link_comment GET    /links/:link_id/comments/:id(.:format)      comments#show
#                   PATCH  /links/:link_id/comments/:id(.:format)      comments#update
#                   PUT    /links/:link_id/comments/:id(.:format)      comments#update
#                   DELETE /links/:link_id/comments/:id(.:format)      comments#destroy
#             links GET    /links(.:format)                            links#index
#                   POST   /links(.:format)                            links#create
#          new_link GET    /links/new(.:format)                        links#new
#         edit_link GET    /links/:id/edit(.:format)                   links#edit
#              link GET    /links/:id(.:format)                        links#show
#                   PATCH  /links/:id(.:format)                        links#update
#                   PUT    /links/:id(.:format)                        links#update
#                   DELETE /links/:id(.:format)                        links#destroy
