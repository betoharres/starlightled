require 'rails_helper'

RSpec.describe "firmwares/index", type: :view do
  before(:each) do
    assign(:firmwares, [
      Firmware.create!(
        :filename => "Filename",
        :content_type => "Content Type",
        :file_content => "",
        :checksum => "Checksum"
      ),
      Firmware.create!(
        :filename => "Filename",
        :content_type => "Content Type",
        :file_content => "",
        :checksum => "Checksum"
      )
    ])
  end

  it "renders a list of firmwares" do
    render
    assert_select "tr>td", :text => "Filename".to_s, :count => 2
    assert_select "tr>td", :text => "Content Type".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Checksum".to_s, :count => 2
  end
end
