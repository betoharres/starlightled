require 'rails_helper'

RSpec.describe "tag_types/index", type: :view do
  before(:each) do
    assign(:tag_types, [
      TagType.create!(
        :name => "Name",
        :description => "Description",
        :exclusive => false,
        :ability => 1,
        :company => nil
      ),
      TagType.create!(
        :name => "Name",
        :description => "Description",
        :exclusive => false,
        :ability => 1,
        :company => nil
      )
    ])
  end

  it "renders a list of tag_types" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
