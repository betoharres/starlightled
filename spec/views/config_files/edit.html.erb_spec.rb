require 'rails_helper'

RSpec.describe "config_files/edit", type: :view do
  before(:each) do
    @config_file = assign(:config_file, ConfigFile.create!(
      :name => "MyString",
      :checksum => "MyString",
      :version => 1.5,
      :content => "",
      :company => nil
    ))
  end

  it "renders the edit config_file form" do
    render

    assert_select "form[action=?][method=?]", config_file_path(@config_file), "post" do

      assert_select "input#config_file_name[name=?]", "config_file[name]"

      assert_select "input#config_file_checksum[name=?]", "config_file[checksum]"

      assert_select "input#config_file_version[name=?]", "config_file[version]"

      assert_select "input#config_file_content[name=?]", "config_file[content]"

      assert_select "input#config_file_company_id[name=?]", "config_file[company_id]"
    end
  end
end
