require 'rails_helper'

RSpec.describe "tasks/edit", type: :view do
  before(:each) do
    @task = assign(:task, Task.create!(
      :code => 1,
      :aasm_state => "MyString",
      :node => nil
    ))
  end

  it "renders the edit task form" do
    render

    assert_select "form[action=?][method=?]", task_path(@task), "post" do

      assert_select "input#task_code[name=?]", "task[code]"

      assert_select "input#task_aasm_state[name=?]", "task[aasm_state]"

      assert_select "input#task_node_id[name=?]", "task[node_id]"
    end
  end
end
