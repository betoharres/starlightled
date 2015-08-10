require 'rails_helper'

RSpec.describe "tasks/new", type: :view do
  before(:each) do
    assign(:task, Task.new(
      :code => 1,
      :aasm_state => "MyString",
      :node => nil
    ))
  end

  it "renders new task form" do
    render

    assert_select "form[action=?][method=?]", tasks_path, "post" do

      assert_select "input#task_code[name=?]", "task[code]"

      assert_select "input#task_aasm_state[name=?]", "task[aasm_state]"

      assert_select "input#task_node_id[name=?]", "task[node_id]"
    end
  end
end
