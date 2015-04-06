require 'rails_helper'

RSpec.describe "user_levels/show", type: :view do
  before(:each) do
    @user_level = assign(:user_level, UserLevel.create!(
      :level => 1,
      :user => nil
    ))
  end

  # it "renders attributes in <p>" do
  #   render
  #   expect(rendered).to match(/1/)
  #   expect(rendered).to match(//)
  # end
end
