require 'rails_helper'

RSpec.describe "nodes/edit", type: :view do
  before(:each) do
    @node = assign(:node, Node.create!(
      :identifier => "MyString",
      :latitude => 1.5,
      :longitude => 1.5
    ))
  end

  it "renders the edit node form" do
    render

    assert_select "form[action=?][method=?]", node_path(@node), "post" do

      assert_select "input#node_identifier[name=?]", "node[identifier]"

      assert_select "input#node_latitude[name=?]", "node[latitude]"

      assert_select "input#node_longitude[name=?]", "node[longitude]"
    end
  end
end
