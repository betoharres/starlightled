require 'rails_helper'

RSpec.describe "config_files/index", type: :view do
  before(:each) do
    assign(:config_files, [
      ConfigFile.create!(
        :name => "Name",
        :checksum => "Checksum",
        :version => 1.5,
        :content => "",
        :company => nil
      ),
      ConfigFile.create!(
        :name => "Name",
        :checksum => "Checksum",
        :version => 1.5,
        :content => "",
        :company => nil
      )
    ])
  end

  it "renders a list of config_files" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Checksum".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
