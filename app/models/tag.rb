class Tag < ActiveRecord::Base
  belongs_to :company
  belongs_to :tag_type
end
