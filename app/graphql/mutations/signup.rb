module Mutations
  class Signup < Mutations::BaseMutation
    null true

    argument :user_signup_input, Types::UserSignupInput, required: true

    def resolve(**args)
      user_signup_input = args[:user_signup_input].to_h
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new e.message
    end
  end
end
