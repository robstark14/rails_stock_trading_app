class User < ApplicationRecord

  validates :email, uniqueness: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable
  # Setup accessible (or protected) attributes for your model
  enum role: [:trader, :admin]
  validates :balance, numericality: {greater_than_or_equal_to: 0}
  validates :state, presence: true
  STATE = ["Pending", "Declined", "Approved"]

  has_many :transactions, dependent: :destroy
  has_many :portfolios, dependent: :destroy
end
