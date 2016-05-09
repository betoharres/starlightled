require 'rails_helper'

RSpec.describe "event_codes/edit", type: :view do
  before(:each) do
    @event_code = assign(:event_code, EventCode.create!(
      :code => 1,
      :name => "MyString"
    ))
  end

  it "renders the edit event_code form" do
    render

    assert_select "form[action=?][method=?]", event_code_path(@event_code), "post" do

      assert_select "input#event_code_code[name=?]", "event_code[code]"

      assert_select "input#event_code_name[name=?]", "event_code[name]"
    end
  end
end
