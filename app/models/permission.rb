class Permission < ActiveRecord::Base
  belongs_to :role

  # like UNIX permissions
  READ   = 8
  CREATE = 4
  UPDATE = 2
  DELETE = 1
  enum ability: {
                 reads: READ                     , creates: CREATE                 ,
                 updates: UPDATE                 , deletes: DELETE                 ,
                 read_creates: READ + CREATE     , read_updates: READ + UPDATE     ,
                 read_deletes: READ + DELETE     , create_updates: CREATE + UPDATE ,
                 create_deletes: CREATE + DELETE , update_deletes: UPDATE + DELETE
                }

end
