require 'rails_helper'

RSpec.describe "companies/show", type: :view do
  before(:each) do
    @company = assign(:company, Company.create!(
      :user => nil,
      :name => "Name",
      :cnpj => "Cnpj",
      :address => "Address",
      :phone => "Phone",
      :email => "Email"
    ))
  end

  # it "renders attributes in <p>" do
    # render
    # expect(rendered).to match(//)
    # expect(rendered).to match(/Name/)
    # expect(rendered).to match(/Cnpj/)
    # expect(rendered).to match(/Address/)
    # expect(rendered).to match(/Phone/)
    # expect(rendered).to match(/Email/)
  # end
end
