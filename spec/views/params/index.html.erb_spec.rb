require 'rails_helper'

RSpec.describe "params/index", type: :view do
  before(:each) do
    assign(:params, [
      Param.create!(
        :name => "Name",
        :code => 1,
        :description => "MyText"
      ),
      Param.create!(
        :name => "Name",
        :code => 1,
        :description => "MyText"
      )
    ])
  end

  it "renders a list of params" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
