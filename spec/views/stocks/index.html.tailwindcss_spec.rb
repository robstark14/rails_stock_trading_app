require 'rails_helper'

RSpec.describe "stocks/index", type: :view do
  before(:each) do
    assign(:stocks, [
      Stock.create!(
        comp_name: "Comp Name",
        stock_symbol: "Stock Symbol",
        comp_description: "MyText"
      ),
      Stock.create!(
        comp_name: "Comp Name",
        stock_symbol: "Stock Symbol",
        comp_description: "MyText"
      )
    ])
  end

  it "renders a list of stocks" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Comp Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Stock Symbol".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
  end
end
