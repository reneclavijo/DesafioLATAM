require 'rails_helper'

RSpec.describe "emersons/show", type: :view do
  before(:each) do
    @emerson = assign(:emerson, Emerson.create!(
      name: "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
