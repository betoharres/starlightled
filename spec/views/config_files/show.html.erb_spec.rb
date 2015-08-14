require 'rails_helper'

RSpec.describe "config_files/show", type: :view do
  before(:each) do
    @config_file = assign(:config_file, ConfigFile.create!(
      :name => "Name",
      :checksum => "Checksum",
      :version => 1.5,
      :content => "",
      :company => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Checksum/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
