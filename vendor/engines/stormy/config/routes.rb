Stormy::Engine.routes.draw do

  namespace "admin" do 
    root to: "posts#index"
    resources :posts
  end

 root to:  "pages#index"
 get '*page' => "pages#show", as: "post"
end
