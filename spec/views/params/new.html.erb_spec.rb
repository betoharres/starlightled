require 'rails_helper'

RSpec.describe "params/new", type: :view do
  before(:each) do
    assign(:param, Param.new(
      :name => "MyString",
      :code => 1,
      :description => "MyText"
    ))
  end

  it "renders new param form" do
    render

    assert_select "form[action=?][method=?]", params_path, "post" do

      assert_select "input#param_name[name=?]", "param[name]"

      assert_select "input#param_code[name=?]", "param[code]"

      assert_select "textarea#param_description[name=?]", "param[description]"
    end
  end
end
