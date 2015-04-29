require 'rails_helper'

RSpec.describe "lamp_stats/show", type: :view do
  before(:each) do
    @lamp_stat = assign(:lamp_stat, LampStat.create!(
      :serialNum => 1,
      :pwr => 2,
      :current => 1.5,
      :volts => 1.5,
      :tCom => 1.5,
      :tLed1 => 1.5,
      :tLed2 => 1.5,
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
      :online => false,
      :communicating => false,
      :sunrise => "Sunrise",
      :sunset => "Sunset"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/5/)
    expect(rendered).to match(/6/)
    expect(rendered).to match(/7/)
    expect(rendered).to match(/8/)
    expect(rendered).to match(/9/)
    expect(rendered).to match(/10/)
    expect(rendered).to match(/11/)
    expect(rendered).to match(/12/)
    expect(rendered).to match(/13/)
    expect(rendered).to match(/14/)
    expect(rendered).to match(/15/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/Sunrise/)
    expect(rendered).to match(/Sunset/)
  end
end
