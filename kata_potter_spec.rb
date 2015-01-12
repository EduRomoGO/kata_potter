require './kata_potter'

RSpec.describe "Potter books price calculator" do

  let(:packages_selector) {packages_selector = Packages_selector.new}

  it "charges 0 if you don´t buy any book" do
    expect( Potter_shopping_basket.new(0,0,0,0,0,packages_selector).calculate_books_price ).to eq(0) 
  end

  it "charges the price of a book if you buy one book" do
    expect( Potter_shopping_basket.new(0,0,0,0,1,packages_selector).calculate_books_price ).to eq(8) 
  end

  it "charges the price of n books if you buy n equal books" do
    expect( Potter_shopping_basket.new(0,0,0,0,9,packages_selector).calculate_books_price ).to eq(72) 
  end

  it "charges the price of two books with 5% discount if you buy two different books" do
    expect( Potter_shopping_basket.new(0,0,0,1,1,packages_selector).calculate_books_price ).to eq(15.2) 
  end

  it "charges the price of two books with 5% discount plus one entire book if you buy 3 books of 2 different types" do
    expect( Potter_shopping_basket.new(0,0,0,2,1,packages_selector).calculate_books_price ).to eq(23.2) 
  end
  
  it "charges the price of three books with 10% discount if you buy 3 different books" do
    expect( Potter_shopping_basket.new(0,1,0,1,1,packages_selector).calculate_books_price ).to eq(21.60)
  end

  it "selects the combination of discounts to get the highest discount possible" do
    expect( Potter_shopping_basket.new(2,1,2,2,1,packages_selector).calculate_books_price ).to eq(51.20)
  end

end