require 'rails_helper'

RSpec.describe "lamps/index", type: :view do
  before(:each) do
    assign(:lamps, [
      Lamp.create!(
        :font_type => "Font Type",
        :font_subtype => "Font Subtype",
        :product => nil
      ),
      Lamp.create!(
        :font_type => "Font Type",
        :font_subtype => "Font Subtype",
        :product => nil
      )
    ])
  end

  # it "renders a list of lamps" do
  #   render
  #   assert_select "tr>td", :text => "Font Type".to_s, :count => 2
  #   assert_select "tr>td", :text => "Font Subtype".to_s, :count => 2
  #   assert_select "tr>td", :text => nil.to_s, :count => 2
  # end
end
