require 'rails_helper'

RSpec.describe "clientes/index", type: :view do
  before(:each) do
    assign(:clientes, [
      Cliente.create!(
        name: "Name"
      ),
      Cliente.create!(
        name: "Name"
      )
    ])
  end

  it "renders a list of clientes" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
  end
end
