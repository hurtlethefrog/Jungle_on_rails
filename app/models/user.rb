class User < ActiveRecord::Base

  has_secure_password
  
  validates :email, uniqueness: { case_sensitive: false }
  validates :email, :first_name, :last_name, :password_confirmation, presence: true
  validates :password, length: { minimum: 7 }
  validates :password, confirmation: true 
end
