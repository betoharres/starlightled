require 'rails_helper'

RSpec.describe "nodes/show", type: :view do
  before(:each) do
    @node = assign(:node, Node.create!(
      :identifier => "Identifier",
      :latitude => 1.5,
      :longitude => 1.5
    ))
  end

  # it "renders attributes in <p>" do
  #   render
  #   expect(rendered).to match(/Identifier/)
  #   expect(rendered).to match(/1.5/)
  #   expect(rendered).to match(/1.5/)
  # end
end
