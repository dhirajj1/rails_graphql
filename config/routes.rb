Rails.application.routes.draw do
  devise_for :users
 
  mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/graphql' if Rails.env.development?

  mount Graphql::Voyager::Rails::Engine, at: '/graphql-voyager', graphql_path: '/graphql'
  post "/graphql", to: "graphql#execute"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
