require './kata_potter'

RSpec.describe "Potter books price calculator" do

  it "charges 0 if you don´t buy any book" do
    expect( Potter_shopping_basket.new(0,0,0,0,0).calculate_books_price ).to eq(0) 
  end

  it "charges the price of a book if you buy one book" do
    expect( Potter_shopping_basket.new(0,0,0,0,1).calculate_books_price ).to eq(8) 
  end

  it "charges the price of two books if you buy two equal books" do
    expect( Potter_shopping_basket.new(0,0,0,0,2).calculate_books_price ).to eq(16) 
  end

  it "charges the price of two books with 5% discount if you buy two different books" do
    expect( Potter_shopping_basket.new(0,0,0,1,1).calculate_books_price ).to eq(15.2) 
  end

  it "charges the price of two books with 5% discount plus one entire book if you buy 3 books of 2 differnt types" do
    expect( Potter_shopping_basket.new(0,0,0,2,1).calculate_books_price ).to eq(23.2) 
  end

end