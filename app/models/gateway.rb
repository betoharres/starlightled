class Gateway < ActiveRecord::Base
  has_one :product, as: :productable, dependent: :destroy

  validates_presence_of :ip, :url_connection, message: I18n.t(:cant_be_blank)
  validates_formatting_of :ip, using: :ip_address_v4, message: I18n.t(:misspelled_ip)

  devise :database_authenticatable, :registerable,
          :validatable
  include DeviseTokenAuth::Concerns::User

  accepts_nested_attributes_for :product
  # audited allow_mass_assignment: true
  acts_as_taggable
end
