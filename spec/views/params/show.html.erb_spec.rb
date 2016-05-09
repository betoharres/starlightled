require 'rails_helper'

RSpec.describe "params/show", type: :view do
  before(:each) do
    @param = assign(:param, Param.create!(
      :name => "Name",
      :code => 1,
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/MyText/)
  end
end
