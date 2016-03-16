require 'rails_helper'

RSpec.describe "commands/new", type: :view do
  before(:each) do
    assign(:command, Command.new(
      :content => "MyString",
      :company => nil
    ))
  end

  it "renders new command form" do
    render

    assert_select "form[action=?][method=?]", commands_path, "post" do

      assert_select "input#command_content[name=?]", "command[content]"

      assert_select "input#command_company_id[name=?]", "command[company_id]"
    end
  end
end
