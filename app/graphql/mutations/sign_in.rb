module Mutations
  class SignIn < Mutations::BaseMutation
    null true

    argument :user_sign_in_input, Types::UserSignInInput, required: true

    def resolve(**args)
      user_params = args[:user_sign_in_input].to_h
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new e.message
    end
  end
end
