require 'rails_helper'

RSpec.describe "emersons/edit", type: :view do
  before(:each) do
    @emerson = assign(:emerson, Emerson.create!(
      name: "MyString"
    ))
  end

  it "renders the edit emerson form" do
    render

    assert_select "form[action=?][method=?]", emerson_path(@emerson), "post" do

      assert_select "input[name=?]", "emerson[name]"
    end
  end
end
