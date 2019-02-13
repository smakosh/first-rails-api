class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def generate_authentication_token!
    begin
      self.apikey = Devise.friendly_token
    end while self.class.exists?(apikey: apikey)
  end
end
