require 'rails_helper'

RSpec.describe "events/index", type: :view do
  before(:each) do
    assign(:events, [
      Event.create!(
        :active => false,
        :node => nil,
        :event_code => nil,
        :param => nil,
        :serial_number => 1
      ),
      Event.create!(
        :active => false,
        :node => nil,
        :event_code => nil,
        :param => nil,
        :serial_number => 1
      )
    ])
  end

  it "renders a list of events" do
    render
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
