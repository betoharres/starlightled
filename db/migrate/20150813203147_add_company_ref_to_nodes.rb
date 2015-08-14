class AddCompanyRefToNodes < ActiveRecord::Migration
  def change
    add_reference :nodes, :company, index: true, foreign_key: true
  end
end
