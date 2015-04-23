require 'rails_helper'

RSpec.describe "permissions/index", type: :view do
  before(:each) do
    @role = FactoryGirl.create(:role)
    assign(:permissions, [
      Permission.create!(
        :resource => "Lamp",
        :ability => :can_read,
        :role => @role
      ),
      Permission.create!(
        :resource => "Gateway",
        :ability => :can_all,
        :role => @role
      )
    ])
  end

  it "renders a list of permissions" do
    render
    expect(rendered).to match(/Lamp/)
    expect(rendered).to match(/Gateway/)
    expect(rendered).to match(/can_read/)
    expect(rendered).to match(/can_all/)
    expect(rendered).to match(/#{@role.name}/)
    # assert_select "tr>td", :text => "Lamp".to_s, :count => 2
    # assert_select "tr>td", :text => Role.first.to_s, :count => 2
    # assert_select "tr>td", :text => Permission::READ.to_s, :count => 2
  end
end
