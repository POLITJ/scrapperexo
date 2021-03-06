require_relative '../lib/darktrader'
​
describe "get_symbols method" do
  it "should return an array with more than 2000 elements" do
    expect(get_symbols.size).to eq(2274)
  end
​
  it "should return an array that includes BTC, ETH and GRAT" do
    expect(get_symbols).to include("BTC")
    expect(get_symbols).to include("ETH")
    expect(get_symbols).to include("GRAT")
  end
​
end
​
describe "get_prices method" do
  it "should return an array with more than 2000 elements" do
    expect(get_prices.size).to eq(2274)
  end
end
​
​
describe "combine method" do
  it "should return a hash and NOT nil" do
    expect(get_prices).not_to be_nil
  end
end