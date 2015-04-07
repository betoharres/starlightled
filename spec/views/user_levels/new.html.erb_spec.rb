require 'rails_helper'

RSpec.describe "user_levels/new", type: :view do
  before(:each) do
    assign(:user_level, UserLevel.new(
      :level => 1,
      :user => nil
    ))
  end

  # it "renders new user_level form" do
  #   render
  #
  #   assert_select "form[action=?][method=?]", user_levels_path, "post" do
  #
  #     assert_select "input#user_level_level[name=?]", "user_level[level]"
  #
  #     assert_select "input#user_level_user_id[name=?]", "user_level[user_id]"
  #   end
  # end
end
