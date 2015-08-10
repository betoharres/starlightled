require 'rails_helper'

RSpec.describe "tasks/index", type: :view do
  before(:each) do
    assign(:tasks, [
      Task.create!(
        :code => 1,
        :aasm_state => "Aasm State",
        :node => nil
      ),
      Task.create!(
        :code => 1,
        :aasm_state => "Aasm State",
        :node => nil
      )
    ])
  end

  it "renders a list of tasks" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Aasm State".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
