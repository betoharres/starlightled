require 'rails_helper'

RSpec.describe "commands/edit", type: :view do
  before(:each) do
    @command = assign(:command, Command.create!(
      :content => "MyString",
      :company => nil
    ))
  end

  it "renders the edit command form" do
    render

    assert_select "form[action=?][method=?]", command_path(@command), "post" do

      assert_select "input#command_content[name=?]", "command[content]"

      assert_select "input#command_company_id[name=?]", "command[company_id]"
    end
  end
end
