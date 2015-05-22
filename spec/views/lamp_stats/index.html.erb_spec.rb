require 'rails_helper'

RSpec.describe "lamp_stats/index", type: :view do
  before(:each) do
    assign(:lamp_stats, [
      LampStat.create!(
        :serial_num => 1,
        :pwr => 2,
        :current => 1.5,
        :volts => 1.6,
        :tCom => 1.7,
        :tLed1 => 1.8,
        :tLed2 => 1.9,
        :sLum => 3,
        :rssiDev => 4,
        :lqiDev => 5,
        :sentPkts => 6,
        :rcvPkts => 7,
        :lastReboot => 8,
        :txPwr => 9,
        :ctrlRestart => 10,
        :vFirmware => 11,
        :vCmd => 12,
        :cksCfg => 13,
        :appCksErr => 14,
        :cmdNotImp => 15,
        :online => true,
        :communicating => false,
        :sunrise => "Sunrise",
        :sunset => "Sunset"
      ),
      LampStat.create!(
        :serial_num => 1,
        :pwr => 2,
        :current => 1.5,
        :volts => 1.6,
        :tCom => 1.7,
        :tLed1 => 1.8,
        :tLed2 => 1.9,
        :sLum => 3,
        :rssiDev => 4,
        :lqiDev => 5,
        :sentPkts => 6,
        :rcvPkts => 7,
        :lastReboot => 8,
        :txPwr => 9,
        :ctrlRestart => 10,
        :vFirmware => 11,
        :vCmd => 12,
        :cksCfg => 13,
        :appCksErr => 14,
        :cmdNotImp => 15,
        :online => true,
        :communicating => false,
        :sunrise => "Sunrise",
        :sunset => "Sunset"
      )
    ])
  end

  it "renders a list of lamp_stats" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.6.to_s, :count => 2
    assert_select "tr>td", :text => 1.7.to_s, :count => 2
    assert_select "tr>td", :text => 1.8.to_s, :count => 2
    assert_select "tr>td", :text => 1.9.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => 6.to_s, :count => 2
    assert_select "tr>td", :text => 7.to_s, :count => 2
    assert_select "tr>td", :text => 8.to_s, :count => 2
    assert_select "tr>td", :text => 9.to_s, :count => 2
    assert_select "tr>td", :text => 10.to_s, :count => 2
    assert_select "tr>td", :text => 11.to_s, :count => 2
    assert_select "tr>td", :text => 12.to_s, :count => 2
    assert_select "tr>td", :text => 13.to_s, :count => 2
    assert_select "tr>td", :text => 14.to_s, :count => 2
    assert_select "tr>td", :text => 15.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Sunrise".to_s, :count => 2
    assert_select "tr>td", :text => "Sunset".to_s, :count => 2
  end
end
