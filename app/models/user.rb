class User < ApplicationRecord

  validates :email, uniqueness: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable
  # Setup accessible (or protected) attributes for your model

end
