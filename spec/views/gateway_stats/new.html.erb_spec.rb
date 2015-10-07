require 'rails_helper'

RSpec.describe "gateway_stats/new", type: :view do
  before(:each) do
    assign(:gateway_stat, GatewayStat.new(
      :serial_num => "",
      :onlineDev => "",
      :signal => "",
      :lqi => "",
      :rssi => "",
      :correlation => "",
      :rcvPkts => 1,
      :sentPkts => "",
      :lastReboot => 1,
      :temp => 1.5,
      :battery => "",
      :vKl => "",
      :vZigbee => "",
      :errorsCount => "",
      :alerts => "",
      :acPwr => false
    ))
  end

  it "renders new gateway_stat form" do
    render

    assert_select "form[action=?][method=?]", gateway_stats_path, "post" do

      assert_select "input#gateway_stat_serial_num[name=?]", "gateway_stat[serial_num]"

      assert_select "input#gateway_stat_onlineDev[name=?]", "gateway_stat[onlineDev]"

      assert_select "input#gateway_stat_signal[name=?]", "gateway_stat[signal]"

      assert_select "input#gateway_stat_lqi[name=?]", "gateway_stat[lqi]"

      assert_select "input#gateway_stat_rssi[name=?]", "gateway_stat[rssi]"

      assert_select "input#gateway_stat_correlation[name=?]", "gateway_stat[correlation]"

      assert_select "input#gateway_stat_rcvPkts[name=?]", "gateway_stat[rcvPkts]"

      assert_select "input#gateway_stat_sentPkts[name=?]", "gateway_stat[sentPkts]"

      assert_select "input#gateway_stat_lastReboot[name=?]", "gateway_stat[lastReboot]"

      assert_select "input#gateway_stat_temp[name=?]", "gateway_stat[temp]"

      assert_select "input#gateway_stat_battery[name=?]", "gateway_stat[battery]"

      assert_select "input#gateway_stat_vKl[name=?]", "gateway_stat[vKl]"

      assert_select "input#gateway_stat_vZigbee[name=?]", "gateway_stat[vZigbee]"

      assert_select "input#gateway_stat_errorsCount[name=?]", "gateway_stat[errorsCount]"

      assert_select "input#gateway_stat_alerts[name=?]", "gateway_stat[alerts]"

      assert_select "input#gateway_stat_acPwr[name=?]", "gateway_stat[acPwr]"
    end
  end
end
