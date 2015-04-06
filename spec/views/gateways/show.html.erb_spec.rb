require 'rails_helper'

RSpec.describe "gateways/show", type: :view do
  before(:each) do
    @gateway = assign(:gateway, Gateway.create!(
      :ip => "Ip",
      :url_connection => "Url Connection"
    ))
  end

  # it "renders attributes in <p>" do
  #   render
  #   expect(rendered).to match(/Ip/)
  #   expect(rendered).to match(/Url Connection/)
  # end
end
