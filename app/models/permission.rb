class Permission < ActiveRecord::Base
  belongs_to :role

  validates_presence_of :ability
  validate :resource_exists

  # like UNIX permissions
  READ   = 8
  CREATE = 4
  UPDATE = 2
  DELETE = 1
  NONE   = 0

  # The keys are in plural because these words were reserved by rails
  enum ability: {
                 can_all: READ + CREATE + UPDATE + DELETE,

                 can_read:   READ                        , can_create: READ + CREATE             ,
                 can_update: READ + UPDATE               , can_delete: READ + DELETE             ,

                 cannot_update: READ + CREATE + DELETE   , cannot_delete: READ + UPDATE + CREATE ,
                 cannot_create: READ + UPDATE + DELETE   ,

                 can_none: NONE
                }

  def resource_exists
    Rails.application.eager_load! if Rails.env.test? || Rails.env.development?

    unless ActiveRecord::Base.descendants.map(&:name).include?(resource)
      errors.add(:resource, "invalid. You must select a resource that rails can identify.")
    end
  end

end
