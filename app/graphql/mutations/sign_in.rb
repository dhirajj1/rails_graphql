module Mutations
  class SignIn < Mutations::BaseMutation
    null true

    argument :user_sign_in_input, Types::UserSignInInput, required: true

    field :token, String, null: true
    field :user, Types::UserType, null: true
    field :message, String, null: true

    def resolve(**args)
      user_params = args[:user_sign_in_input].to_h
      raise GraphQL::ExecutionError, I18n.t('devise.failure.invalid', authentication_keys: 'email') unless user && user.valid_password?(user_params[:password])
      token = user.generate_jwt
      { user: user, token: token, message: "Successfully sign in." }
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new e.message
    end
  end
end
