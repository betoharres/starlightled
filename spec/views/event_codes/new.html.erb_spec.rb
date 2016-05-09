require 'rails_helper'

RSpec.describe "event_codes/new", type: :view do
  before(:each) do
    assign(:event_code, EventCode.new(
      :code => 1,
      :name => "MyString"
    ))
  end

  it "renders new event_code form" do
    render

    assert_select "form[action=?][method=?]", event_codes_path, "post" do

      assert_select "input#event_code_code[name=?]", "event_code[code]"

      assert_select "input#event_code_name[name=?]", "event_code[name]"
    end
  end
end
