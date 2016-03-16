require 'rails_helper'

RSpec.describe "commands/show", type: :view do
  before(:each) do
    @command = assign(:command, Command.create!(
      :content => "Content",
      :company => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Content/)
    expect(rendered).to match(//)
  end
end
