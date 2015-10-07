require 'rails_helper'

RSpec.describe "gateway_stats/show", type: :view do
  before(:each) do
    @gateway_stat = assign(:gateway_stat, GatewayStat.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/1/)
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/false/)
  end
end
