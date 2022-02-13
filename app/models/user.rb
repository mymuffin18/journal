class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :email,presence: true, uniqueness: true, format: {with: URI::MailTo::EMAIL_REGEXP}
  validates :password, presence: true
  
  devise :database_authenticatable, :registerable,
        :jwt_authenticatable,
        jwt_revocation_strategy: JwtDenylist
end
