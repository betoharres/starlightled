require 'rails_helper'

RSpec.describe "user_levels/edit", type: :view do
  before(:each) do
    @user_level = assign(:user_level, UserLevel.create!(
      :level => 1,
      :user => nil
    ))
  end

  # it "renders the edit user_level form" do
  #   render
  #
  #   assert_select "form[action=?][method=?]", user_level_path(@user_level), "post" do
  #
  #     assert_select "input#user_level_level[name=?]", "user_level[level]"
  #
  #     assert_select "input#user_level_user_id[name=?]", "user_level[user_id]"
  #   end
  # end
end
