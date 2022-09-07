require 'rails_helper'

RSpec.describe "stocks/edit", type: :view do
  before(:each) do
    @stock = assign(:stock, Stock.create!(
      comp_name: "MyString",
      stock_symbol: "MyString",
      comp_description: "MyText"
    ))
  end

  it "renders the edit stock form" do
    render

    assert_select "form[action=?][method=?]", stock_path(@stock), "post" do

      assert_select "input[name=?]", "stock[comp_name]"

      assert_select "input[name=?]", "stock[stock_symbol]"

      assert_select "textarea[name=?]", "stock[comp_description]"
    end
  end
end
