class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  # def jwt_payload
  #   super
  # end
  def generate_jwt
    JWT.encode({id: id, exp: 60.days.from_now.to_i}, Rails.application.secrets.secret_key_base)
  end
end
