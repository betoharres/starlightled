require 'rails_helper'

RSpec.describe "companies/new", type: :view do
  before(:each) do
    assign(:company, Company.new(
      :user => nil,
      :name => "MyString",
      :cnpj => "MyString",
      :address => "MyString",
      :phone => "MyString",
      :email => "MyString"
    ))
  end

  it "renders new company form" do
    render

    assert_select "form[action=?][method=?]", companies_path, "post" do

      assert_select "input#company_user_id[name=?]", "company[user_id]"

      assert_select "input#company_name[name=?]", "company[name]"

      assert_select "input#company_cnpj[name=?]", "company[cnpj]"

      assert_select "input#company_address[name=?]", "company[address]"

      assert_select "input#company_phone[name=?]", "company[phone]"

      assert_select "input#company_email[name=?]", "company[email]"
    end
  end
end
