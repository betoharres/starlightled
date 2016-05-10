require 'rails_helper'

RSpec.describe "events/new", type: :view do
  before(:each) do
    assign(:event, Event.new(
      :active => false,
      :node => nil,
      :event_code => nil,
      :param => nil,
      :serial_number => 1
    ))
  end

  it "renders new event form" do
    render

    assert_select "form[action=?][method=?]", events_path, "post" do

      assert_select "input#event_active[name=?]", "event[active]"

      assert_select "input#event_node_id[name=?]", "event[node_id]"

      assert_select "input#event_event_code_id[name=?]", "event[event_code_id]"

      assert_select "input#event_param_id[name=?]", "event[param_id]"

      assert_select "input#event_serial_number[name=?]", "event[serial_number]"
    end
  end
end
