class AddAlertsAndErrorsToLampStats < ActiveRecord::Migration
  def change
    add_column :lamp_stats, :alerts, :integer, limit: 2
    add_column :lamp_stats, :errors, :integer, limit: 2
  end
end
