require 'rails_helper'

RSpec.describe "networks/new", type: :view do
  before(:each) do
    assign(:network, Network.new(
      :name => "MyString",
      :company => nil
    ))
  end

  # it "renders new network form" do
  #   render
  #
  #   assert_select "form[action=?][method=?]", networks_path, "post" do
  #
  #     assert_select "input#network_name[name=?]", "network[name]"
  #
  #     assert_select "input#network_company_id[name=?]", "network[company_id]"
  #   end
  # end
end
