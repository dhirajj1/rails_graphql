module Queries
  module UserModule
    extend ActiveSupport::Concern
    include GraphQL::Schema::Member::GraphQLTypeNames

    included do
      field :users, [Types::UserType], null: false
    end

    def users
      User.all
    end
  end
end
