require 'rails_helper'

RSpec.describe "firmwares/show", type: :view do
  before(:each) do
    @firmware = assign(:firmware, Firmware.create!(
      :filename => "Filename",
      :content_type => "Content Type",
      :file_content => "",
      :checksum => "Checksum"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Filename/)
    expect(rendered).to match(/Content Type/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Checksum/)
  end
end
