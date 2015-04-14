require 'rails_helper'

RSpec.describe "permissions/index", type: :view do
  before(:each) do
    @role = FactoryGirl.create(:role)
    assign(:permissions, [
      Permission.create!(
        :resource => "Lamp",
        :ability => :reads,
        :role => @role
      ),
      Permission.create!(
        :resource => "Gateway",
        :ability => :admin,
        :role => @role
      )
    ])
  end

  it "renders a list of permissions" do
    render
    expect(rendered).to match(/Lamp/)
    expect(rendered).to match(/Gateway/)
    expect(rendered).to match(/reads/)
    expect(rendered).to match(/admin/)
    expect(rendered).to match(/#{@role.name}/)
    # assert_select "tr>td", :text => "Lamp".to_s, :count => 2
    # assert_select "tr>td", :text => Role.first.to_s, :count => 2
    # assert_select "tr>td", :text => Permission::READ.to_s, :count => 2
  end
end
