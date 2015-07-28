require 'rails_helper'

RSpec.describe "tag_types/show", type: :view do
  before(:each) do
    @tag_type = assign(:tag_type, TagType.create!(
      :name => "Name",
      :description => "Description",
      :exclusive => false,
      :ability => 1,
      :company => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(//)
  end
end
