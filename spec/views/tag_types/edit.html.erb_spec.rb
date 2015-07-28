require 'rails_helper'

RSpec.describe "tag_types/edit", type: :view do
  before(:each) do
    @tag_type = assign(:tag_type, TagType.create!(
      :name => "MyString",
      :description => "MyString",
      :exclusive => false,
      :ability => 1,
      :company => nil
    ))
  end

  it "renders the edit tag_type form" do
    render

    assert_select "form[action=?][method=?]", tag_type_path(@tag_type), "post" do

      assert_select "input#tag_type_name[name=?]", "tag_type[name]"

      assert_select "input#tag_type_description[name=?]", "tag_type[description]"

      assert_select "input#tag_type_exclusive[name=?]", "tag_type[exclusive]"

      assert_select "input#tag_type_ability[name=?]", "tag_type[ability]"

      assert_select "input#tag_type_company_id[name=?]", "tag_type[company_id]"
    end
  end
end
