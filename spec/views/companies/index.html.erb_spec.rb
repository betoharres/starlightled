require 'rails_helper'

RSpec.describe "companies/index", type: :view do
  before(:each) do
    assign(:companies, [
      Company.create!(
        :user => nil,
        :name => "Name",
        :cnpj => "Cnpj",
        :address => "Address",
        :phone => "Phone",
        :email => "Email"
      ),
      Company.create!(
        :user => nil,
        :name => "Name",
        :cnpj => "Cnpj",
        :address => "Address",
        :phone => "Phone",
        :email => "Email"
      )
    ])
  end

  it "renders a list of companies" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Cnpj".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
  end
end
