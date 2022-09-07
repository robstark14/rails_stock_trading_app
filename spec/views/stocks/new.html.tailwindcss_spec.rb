require 'rails_helper'

RSpec.describe "stocks/new", type: :view do
  before(:each) do
    assign(:stock, Stock.new(
      comp_name: "MyString",
      stock_symbol: "MyString",
      comp_description: "MyText"
    ))
  end

  it "renders new stock form" do
    render

    assert_select "form[action=?][method=?]", stocks_path, "post" do

      assert_select "input[name=?]", "stock[comp_name]"

      assert_select "input[name=?]", "stock[stock_symbol]"

      assert_select "textarea[name=?]", "stock[comp_description]"
    end
  end
end
