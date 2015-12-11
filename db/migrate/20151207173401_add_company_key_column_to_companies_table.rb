class AddCompanyKeyColumnToCompaniesTable < ActiveRecord::Migration
  def change
    add_column :companies, :company_key, :string
  end
end
