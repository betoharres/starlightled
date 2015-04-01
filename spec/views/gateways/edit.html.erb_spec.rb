require 'rails_helper'

RSpec.describe "gateways/edit", type: :view do
  before(:each) do
    @gateway = assign(:gateway, Gateway.create!(
      :ip => "MyString",
      :url_connection => "MyString"
    ))
  end

  it "renders the edit gateway form" do
    render

    assert_select "form[action=?][method=?]", gateway_path(@gateway), "post" do

      assert_select "input#gateway_ip[name=?]", "gateway[ip]"

      assert_select "input#gateway_url_connection[name=?]", "gateway[url_connection]"
    end
  end
end
