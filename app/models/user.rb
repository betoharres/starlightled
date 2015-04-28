class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable

  has_many :companies
  belongs_to :company
  has_one :role

  # https://github.com/collectiveidea/audited
  audited allow_mass_assignment: true

end
