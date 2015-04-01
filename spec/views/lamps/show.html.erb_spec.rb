require 'rails_helper'

RSpec.describe "lamps/show", type: :view do
  before(:each) do
    @lamp = assign(:lamp, Lamp.create!(
      :font_type => "Font Type",
      :font_subtype => "Font Subtype",
      :product => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Font Type/)
    expect(rendered).to match(/Font Subtype/)
    expect(rendered).to match(//)
  end
end
