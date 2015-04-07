require 'rails_helper'

RSpec.describe "products/index", type: :view do
  before(:each) do
    assign(:products, [
      Product.create!(
        :name => "Name",
        :model => "Model",
        :serial_number => "Serial Number",
        :mac_address => "Mac Address",
        :product_code => "Product Code",
        :tension_operation => 1,
        :node => nil
      ),
      Product.create!(
        :name => "Name",
        :model => "Model",
        :serial_number => "Serial Number",
        :mac_address => "Mac Address",
        :product_code => "Product Code",
        :tension_operation => 1,
        :node => nil
      )
    ])
  end

  # it "renders a list of products" do
  #   render
  #   assert_select "tr>td", :text => "Name".to_s, :count => 2
  #   assert_select "tr>td", :text => "Model".to_s, :count => 2
  #   assert_select "tr>td", :text => "Serial Number".to_s, :count => 2
  #   assert_select "tr>td", :text => "Mac Address".to_s, :count => 2
  #   assert_select "tr>td", :text => "Product Code".to_s, :count => 2
  #   assert_select "tr>td", :text => 1.to_s, :count => 2
  #   assert_select "tr>td", :text => nil.to_s, :count => 2
  # end
end
