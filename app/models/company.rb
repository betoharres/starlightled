class Company < ActiveRecord::Base
  belongs_to :user
  has_many :users
  has_many :roles
  has_many :products
  has_many :firmwares
  has_many :config_files
  has_many :tasks
  has_many :networks

  validates_formatting_of :email, using: :email

  has_associated_audits
  acts_as_tagger
end
