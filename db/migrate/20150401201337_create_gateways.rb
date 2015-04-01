class CreateGateways < ActiveRecord::Migration
  def change
    create_table :gateways do |t|
      t.string :ip
      t.string :url_connection

      t.timestamps
    end
  end
end
