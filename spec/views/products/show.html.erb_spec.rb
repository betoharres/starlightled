require 'rails_helper'

RSpec.describe "products/show", type: :view do
  before(:each) do
    @product = assign(:product, Product.create!(
      :name => "Name",
      :model => "Model",
      :serial_number => "Serial Number",
      :mac_address => "Mac Address",
      :product_code => "Product Code",
      :tension_operation => 1,
      :node => nil
    ))
  end

  # it "renders attributes in <p>" do
  #   render
  #   expect(rendered).to match(/Name/)
  #   expect(rendered).to match(/Model/)
  #   expect(rendered).to match(/Serial Number/)
  #   expect(rendered).to match(/Mac Address/)
  #   expect(rendered).to match(/Product Code/)
  #   expect(rendered).to match(/1/)
  #   expect(rendered).to match(//)
  # end
end
