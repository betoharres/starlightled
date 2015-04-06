require 'rails_helper'

RSpec.describe "user_levels/index", type: :view do
  before(:each) do
    assign(:user_levels, [
      UserLevel.create!(
        :level => 1,
        :user => nil
      ),
      UserLevel.create!(
        :level => 1,
        :user => nil
      )
    ])
  end

  # it "renders a list of user_levels" do
  #   render
  #   assert_select "tr>td", :text => 1.to_s, :count => 2
  #   assert_select "tr>td", :text => nil.to_s, :count => 2
  # end
end
