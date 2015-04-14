class Permission < ActiveRecord::Base
  belongs_to :role

  validates_presence_of :ability
  validate :resource_exists

  # like UNIX permissions
  READ   = 8
  CREATE = 4
  UPDATE = 2
  DELETE = 1
  enum ability: {
                 admin: READ + CREATE + UPDATE + DELETE,
                 reads: READ                     , creates: CREATE                 ,
                 updates: UPDATE                 , deletes: DELETE                 ,
                 read_creates: READ + CREATE     , read_updates: READ + UPDATE     ,
                 read_deletes: READ + DELETE     , create_updates: CREATE + UPDATE ,
                 create_deletes: CREATE + DELETE , update_deletes: UPDATE + DELETE
                }

  def resource_exists
    Rails.application.eager_load! if Rails.env.test? || Rails.env.development?

    unless ActiveRecord::Base.descendants.map(&:name).include?(resource)
      errors.add(:resource, "Not a valid resource")
    end
  end

end
