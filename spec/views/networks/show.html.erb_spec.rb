require 'rails_helper'

RSpec.describe "networks/show", type: :view do
  before(:each) do
    @network = assign(:network, Network.create!(
      :name => "Name",
      :company => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(//)
  end
end
