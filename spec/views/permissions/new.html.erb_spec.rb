require 'rails_helper'

RSpec.describe "permissions/new", type: :view do
  before(:each) do
    assign(:permission, Permission.new(
      :resource => "MyString",
      :ability => 1,
      :role => nil
    ))
  end

  it "renders new permission form" do
    render

    assert_select "form[action=?][method=?]", permissions_path, "post" do

      assert_select "input#permission_resource[name=?]", "permission[resource]"

      assert_select "input#permission_ability[name=?]", "permission[ability]"

      assert_select "input#permission_role_id[name=?]", "permission[role_id]"
    end
  end
end
