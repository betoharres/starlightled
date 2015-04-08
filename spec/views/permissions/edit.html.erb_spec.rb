require 'rails_helper'

RSpec.describe "permissions/edit", type: :view do
  before(:each) do
    @permission = assign(:permission, Permission.create!(
      :resource => "MyString",
      :ability => 1,
      :role => nil
    ))
  end

  # it "renders the edit permission form" do
  #   render
  #
  #   assert_select "form[action=?][method=?]", permission_path(@permission), "post" do
  #
  #     assert_select "input#permission_resource[name=?]", "permission[resource]"
  #
  #     assert_select "input#permission_ability[name=?]", "permission[ability]"
  #
  #     assert_select "input#permission_role_id[name=?]", "permission[role_id]"
  #   end
  # end
end
