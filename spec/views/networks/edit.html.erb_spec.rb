require 'rails_helper'

RSpec.describe "networks/edit", type: :view do
  before(:each) do
    @network = assign(:network, Network.create!(
      :name => "MyString",
      :company => nil
    ))
  end

  # it "renders the edit network form" do
  #   render
  #
  #   assert_select "form[action=?][method=?]", network_path(@network), "post" do
  #
  #     assert_select "input#network_name[name=?]", "network[name]"
  #
  #     assert_select "input#network_company_id[name=?]", "network[company_id]"
  #   end
  # end
end
