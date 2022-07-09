require 'rails_helper'

RSpec.describe "emersons/index", type: :view do
  before(:each) do
    assign(:emersons, [
      Emerson.create!(
        name: "Name"
      ),
      Emerson.create!(
        name: "Name"
      )
    ])
  end

  it "renders a list of emersons" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
  end
end
