require 'rails_helper'

RSpec.describe "nodes/index", type: :view do
  before(:each) do
    assign(:nodes, [
      Node.create!(
        :identifier => "Identifier",
        :latitude => 1.5,
        :longitude => 1.5
      ),
      Node.create!(
        :identifier => "Identifier",
        :latitude => 1.5,
        :longitude => 1.5
      )
    ])
  end

  # it "renders a list of nodes" do
  #   render
  #   assert_select "tr>td", :text => "Identifier".to_s, :count => 2
  #   assert_select "tr>td", :text => 1.5.to_s, :count => 2
  #   assert_select "tr>td", :text => 1.5.to_s, :count => 2
  # end
end
