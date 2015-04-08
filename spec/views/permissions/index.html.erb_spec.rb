require 'rails_helper'

RSpec.describe "permissions/index", type: :view do
  before(:each) do
    assign(:permissions, [
      Permission.create!(
        :resource => "Resource",
        :ability => 1,
        :role => nil
      ),
      Permission.create!(
        :resource => "Resource",
        :ability => 1,
        :role => nil
      )
    ])
  end

  it "renders a list of permissions" do
    render
    assert_select "tr>td", :text => "Resource".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
