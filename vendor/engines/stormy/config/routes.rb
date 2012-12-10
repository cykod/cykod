Stormy::Engine.routes.draw do

  namespace "admin" do 
    resources :posts
  end

 root to:  "pages#index"
 get '*page' => "pages#show", as: "post"
end
