require 'rails_helper'

RSpec.describe "params/edit", type: :view do
  before(:each) do
    @param = assign(:param, Param.create!(
      :name => "MyString",
      :code => 1,
      :description => "MyText"
    ))
  end

  it "renders the edit param form" do
    render

    assert_select "form[action=?][method=?]", param_path(@param), "post" do

      assert_select "input#param_name[name=?]", "param[name]"

      assert_select "input#param_code[name=?]", "param[code]"

      assert_select "textarea#param_description[name=?]", "param[description]"
    end
  end
end
