require 'rails_helper'

RSpec.describe "firmwares/edit", type: :view do
  before(:each) do
    @firmware = assign(:firmware, Firmware.create!(
      :filename => "MyString",
      :content_type => "MyString",
      :file_content => "",
      :checksum => "MyString"
    ))
  end

  it "renders the edit firmware form" do
    render

    assert_select "form[action=?][method=?]", firmware_path(@firmware), "post" do

      assert_select "input#firmware_file[name=?]", "firmware[file]"
    end
  end
end
