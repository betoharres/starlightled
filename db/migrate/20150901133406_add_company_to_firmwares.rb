class AddCompanyToFirmwares < ActiveRecord::Migration
  def change
    add_reference :firmwares, :company, index: true, foreign_key: true
  end
end
