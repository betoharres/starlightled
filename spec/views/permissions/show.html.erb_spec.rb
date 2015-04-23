require 'rails_helper'

RSpec.describe "permissions/show", type: :view do
  before(:each) do
    @permission = assign(:permission, Permission.create!(
      :resource => "Lamp",
      :ability => :can_all,
      :role => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Lamp/)
    expect(rendered).to match(/can_all/)
    expect(rendered).to match(//)
  end
end
