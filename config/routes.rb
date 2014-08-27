Rails.application.routes.draw do
 root :to => 'links#index'
 resources :links
 resources :comments
end

#         root GET    /                            links#index
#        links GET    /links(.:format)             links#index
#              POST   /links(.:format)             links#create
#     new_link GET    /links/new(.:format)         links#new
#    edit_link GET    /links/:id/edit(.:format)    links#edit
#         link GET    /links/:id(.:format)         links#show
#              PATCH  /links/:id(.:format)         links#update
#              PUT    /links/:id(.:format)         links#update
#              DELETE /links/:id(.:format)         links#destroy

#     comments GET    /comments(.:format)          comments#index
#              POST   /comments(.:format)          comments#create
#  new_comment GET    /comments/new(.:format)      comments#new
# edit_comment GET    /comments/:id/edit(.:format) comments#edit
#      comment GET    /comments/:id(.:format)      comments#show
#              PATCH  /comments/:id(.:format)      comments#update
#              PUT    /comments/:id(.:format)      comments#update
#              DELETE /comments/:id(.:format)      comments#destroy
