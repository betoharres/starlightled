class CreateNetworksNodes < ActiveRecord::Migration
  def change
    create_table :networks_nodes do |t|
      t.references :network, index: true, foreign_key: true
      t.references :node, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
