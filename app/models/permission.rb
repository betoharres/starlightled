class Permission < ActiveRecord::Base
  belongs_to :role

  # like UNIX permissions
  READ   = 8
  CREATE = 4
  UPDATE = 2
  DELETE = 1
  enum ability: {
                 read: READ                     , create: CREATE                 ,
                 update: UPDATE                 , delete: DELETE                 ,
                 read_create: READ + CREATE     , read_update: READ + UPDATE     ,
                 read_delete: READ + DELETE     , create_update: CREATE + UPDATE ,
                 create_delete: CREATE + DELETE , update_delete: UPDATE + DELETE
                }

end
