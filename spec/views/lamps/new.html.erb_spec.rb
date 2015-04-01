require 'rails_helper'

RSpec.describe "lamps/new", type: :view do
  before(:each) do
    assign(:lamp, Lamp.new(
      :font_type => "MyString",
      :font_subtype => "MyString",
      :product => nil
    ))
  end

  it "renders new lamp form" do
    render

    assert_select "form[action=?][method=?]", lamps_path, "post" do

      assert_select "input#lamp_font_type[name=?]", "lamp[font_type]"

      assert_select "input#lamp_font_subtype[name=?]", "lamp[font_subtype]"

      assert_select "input#lamp_product_id[name=?]", "lamp[product_id]"
    end
  end
end
