require 'rails_helper'

RSpec.describe "stocks/show", type: :view do
  before(:each) do
    @stock = assign(:stock, Stock.create!(
      comp_name: "Comp Name",
      stock_symbol: "Stock Symbol",
      comp_description: "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Comp Name/)
    expect(rendered).to match(/Stock Symbol/)
    expect(rendered).to match(/MyText/)
  end
end
