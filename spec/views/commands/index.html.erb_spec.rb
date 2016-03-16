require 'rails_helper'

RSpec.describe "commands/index", type: :view do
  before(:each) do
    assign(:commands, [
      Command.create!(
        :content => "Content",
        :company => nil
      ),
      Command.create!(
        :content => "Content",
        :company => nil
      )
    ])
  end

  it "renders a list of commands" do
    render
    assert_select "tr>td", :text => "Content".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
