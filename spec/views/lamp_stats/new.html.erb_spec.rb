require 'rails_helper'

RSpec.describe "lamp_stats/new", type: :view do
  before(:each) do
    assign(:lamp_stat, LampStat.new(
      :serialNum => 1,
      :pwr => 1,
      :current => 1.5,
      :volts => 1.5,
      :tCom => 1.5,
      :tLed1 => 1.5,
      :tLed2 => 1.5,
      :sLum => 1,
      :rssiDev => 1,
      :lqiDev => 1,
      :sentPkts => 1,
      :rcvPkts => 1,
      :lastReboot => 1,
      :txPwr => 1,
      :ctrlRestart => 1,
      :vFirmware => 1,
      :vCmd => 1,
      :cksCfg => 1,
      :appCksErr => 1,
      :cmdNotImp => 1,
      :online => false,
      :communicating => false,
      :sunrise => "MyString",
      :sunset => "MyString"
    ))
  end

  it "renders new lamp_stat form" do
    render

    assert_select "form[action=?][method=?]", lamp_stats_path, "post" do

      assert_select "input#lamp_stat_serialNum[name=?]", "lamp_stat[serialNum]"

      assert_select "input#lamp_stat_pwr[name=?]", "lamp_stat[pwr]"

      assert_select "input#lamp_stat_current[name=?]", "lamp_stat[current]"

      assert_select "input#lamp_stat_volts[name=?]", "lamp_stat[volts]"

      assert_select "input#lamp_stat_tCom[name=?]", "lamp_stat[tCom]"

      assert_select "input#lamp_stat_tLed1[name=?]", "lamp_stat[tLed1]"

      assert_select "input#lamp_stat_tLed2[name=?]", "lamp_stat[tLed2]"

      assert_select "input#lamp_stat_sLum[name=?]", "lamp_stat[sLum]"

      assert_select "input#lamp_stat_rssiDev[name=?]", "lamp_stat[rssiDev]"

      assert_select "input#lamp_stat_lqiDev[name=?]", "lamp_stat[lqiDev]"

      assert_select "input#lamp_stat_sentPkts[name=?]", "lamp_stat[sentPkts]"

      assert_select "input#lamp_stat_rcvPkts[name=?]", "lamp_stat[rcvPkts]"

      assert_select "input#lamp_stat_lastReboot[name=?]", "lamp_stat[lastReboot]"

      assert_select "input#lamp_stat_txPwr[name=?]", "lamp_stat[txPwr]"

      assert_select "input#lamp_stat_ctrlRestart[name=?]", "lamp_stat[ctrlRestart]"

      assert_select "input#lamp_stat_vFirmware[name=?]", "lamp_stat[vFirmware]"

      assert_select "input#lamp_stat_vCmd[name=?]", "lamp_stat[vCmd]"

      assert_select "input#lamp_stat_cksCfg[name=?]", "lamp_stat[cksCfg]"

      assert_select "input#lamp_stat_appCksErr[name=?]", "lamp_stat[appCksErr]"

      assert_select "input#lamp_stat_cmdNotImp[name=?]", "lamp_stat[cmdNotImp]"

      assert_select "input#lamp_stat_online[name=?]", "lamp_stat[online]"

      assert_select "input#lamp_stat_communicating[name=?]", "lamp_stat[communicating]"

      assert_select "input#lamp_stat_sunrise[name=?]", "lamp_stat[sunrise]"

      assert_select "input#lamp_stat_sunset[name=?]", "lamp_stat[sunset]"
    end
  end
end
