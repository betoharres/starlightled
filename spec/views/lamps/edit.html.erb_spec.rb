require 'rails_helper'

RSpec.describe "lamps/edit", type: :view do
  before(:each) do
    @lamp = assign(:lamp, Lamp.create!(
      :font_type => "MyString",
      :font_subtype => "MyString",
      :product => nil
    ))
  end

  # it "renders the edit lamp form" do
  #   render
  #
  #   assert_select "form[action=?][method=?]", lamp_path(@lamp), "post" do
  #
  #     assert_select "input#lamp_font_type[name=?]", "lamp[font_type]"
  #
  #     assert_select "input#lamp_font_subtype[name=?]", "lamp[font_subtype]"
  #
  #     assert_select "input#lamp_product_id[name=?]", "lamp[product_id]"
  #   end
  # end
end
