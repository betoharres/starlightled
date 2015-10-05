require 'rails_helper'

RSpec.describe "gateway_stats/index", type: :view do
  before(:each) do
    assign(:gateway_stats, [
      GatewayStat.create!(
        :serial_num => "",
        :onlineDev => "",
        :signal => "",
        :lqi => "",
        :rssi => "",
        :correlation => "",
        :rcvPkts => 1,
        :sentPkts => "",
        :lastReboot => 2,
        :temp => 1.5,
        :battery => "",
        :vKl => "",
        :vZigbee => "",
        :errorsCount => "",
        :alerts => "",
        :acPwr => false
      ),
      GatewayStat.create!(
        :serial_num => "",
        :onlineDev => "",
        :signal => "",
        :lqi => "",
        :rssi => "",
        :correlation => "",
        :rcvPkts => 1,
        :sentPkts => "",
        :lastReboot => 2,
        :temp => 1.5,
        :battery => "",
        :vKl => "",
        :vZigbee => "",
        :errorsCount => "",
        :alerts => "",
        :acPwr => false
      )
    ])
  end

  it "renders a list of gateway_stats" do
    render
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
