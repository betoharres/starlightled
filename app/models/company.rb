class Company < ActiveRecord::Base
  belongs_to :user
  has_many :users

  has_many :networks
  validates_formatting_of :email, using: :email
end
