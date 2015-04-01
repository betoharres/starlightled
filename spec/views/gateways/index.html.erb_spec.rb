require 'rails_helper'

RSpec.describe "gateways/index", type: :view do
  before(:each) do
    assign(:gateways, [
      Gateway.create!(
        :ip => "Ip",
        :url_connection => "Url Connection"
      ),
      Gateway.create!(
        :ip => "Ip",
        :url_connection => "Url Connection"
      )
    ])
  end

  it "renders a list of gateways" do
    render
    assert_select "tr>td", :text => "Ip".to_s, :count => 2
    assert_select "tr>td", :text => "Url Connection".to_s, :count => 2
  end
end
