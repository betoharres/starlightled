class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :cnpj
      t.string :address
      t.string :phone
      t.string :email
      t.references :user, index: true, null: false

      t.timestamps null: false
    end
  end
end
