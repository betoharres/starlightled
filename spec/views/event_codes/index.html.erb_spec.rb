require 'rails_helper'

RSpec.describe "event_codes/index", type: :view do
  before(:each) do
    assign(:event_codes, [
      EventCode.create!(
        :code => 1,
        :name => "Name"
      ),
      EventCode.create!(
        :code => 1,
        :name => "Name"
      )
    ])
  end

  it "renders a list of event_codes" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
