require 'rails_helper'

RSpec.describe "gateways/new", type: :view do
  before(:each) do
    assign(:gateway, Gateway.new(
      :ip => "MyString",
      :url_connection => "MyString"
    ))
  end

  it "renders new gateway form" do
    render

    assert_select "form[action=?][method=?]", gateways_path, "post" do

      assert_select "input#gateway_ip[name=?]", "gateway[ip]"

      assert_select "input#gateway_url_connection[name=?]", "gateway[url_connection]"
    end
  end
end
