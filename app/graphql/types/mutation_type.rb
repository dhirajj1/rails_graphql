module Types
  class MutationType < Types::BaseObject
    field :signup, mutation: Mutations::Signup
    field :signIn, mutation: Mutations::SignIn
  end
end
