require 'rails_helper'

RSpec.describe "firmwares/new", type: :view do
  before(:each) do
    assign(:firmware, Firmware.new(
      :filename => "MyString",
      :content_type => "MyString",
      :file_content => "",
      :checksum => "MyString"
    ))
  end

  it "renders new firmware form" do
    render

    assert_select "form[action=?][method=?]", firmwares_path, "post" do

      assert_select "input#firmware_file[name=?]", "firmware[file]"
    end
  end
end
