class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.references :user, index: true
      t.string :name
      t.string :cnpj
      t.string :address
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
