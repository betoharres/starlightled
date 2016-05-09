require 'rails_helper'

RSpec.describe "event_codes/show", type: :view do
  before(:each) do
    @event_code = assign(:event_code, EventCode.create!(
      :code => 1,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Name/)
  end
end
