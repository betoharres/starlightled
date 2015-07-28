require 'rails_helper'

RSpec.describe "tag_types/new", type: :view do
  before(:each) do
    assign(:tag_type, TagType.new(
      :name => "MyString",
      :description => "MyString",
      :exclusive => false,
      :ability => 1,
      :company => nil
    ))
  end

  it "renders new tag_type form" do
    render

    assert_select "form[action=?][method=?]", tag_types_path, "post" do

      assert_select "input#tag_type_name[name=?]", "tag_type[name]"

      assert_select "input#tag_type_description[name=?]", "tag_type[description]"

      assert_select "input#tag_type_exclusive[name=?]", "tag_type[exclusive]"

      assert_select "input#tag_type_ability[name=?]", "tag_type[ability]"

      assert_select "input#tag_type_company_id[name=?]", "tag_type[company_id]"
    end
  end
end
