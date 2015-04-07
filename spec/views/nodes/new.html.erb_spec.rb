require 'rails_helper'

RSpec.describe "nodes/new", type: :view do
  before(:each) do
    assign(:node, Node.new(
      :identifier => "MyString",
      :latitude => 1.5,
      :longitude => 1.5
    ))
  end

  # it "renders new node form" do
  #   render
  #
  #   assert_select "form[action=?][method=?]", nodes_path, "post" do
  #
  #     assert_select "input#node_identifier[name=?]", "node[identifier]"
  #
  #     assert_select "input#node_latitude[name=?]", "node[latitude]"
  #
  #     assert_select "input#node_longitude[name=?]", "node[longitude]"
  #   end
  # end
end
