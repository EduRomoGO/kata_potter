=begin

One copy of any of the five books costs 8 EUR. If, however, you buy two different books from the series, you get a 5% discount on those two books. If you buy 3 different books, you get a 10% discount. With 4 different books, you get a 20% discount. If you go the whole hog, and buy all 5, you get a huge 25% discount.

Note that if you buy, say, four books, of which 3 are different titles, you get a 10% discount on the 3 that form part of a set, but the fourth book still costs 8 EUR.

Potter mania is sweeping the country and parents of teenagers everywhere are queueing up with shopping baskets overflowing with Potter books. Your mission is to write a piece of code to calculate the price of any conceivable shopping basket, giving as big a discount as possible.

For example, how much does this basket of books cost?

  2 copies of the first book
  2 copies of the second book
  2 copies of the third book
  1 copy of the fourth book
  1 copy of the fifth book

=end

require 'pry'
require './packages_selector'

class Potter_shopping_basket

  BOOK_PRICE = 8

  def initialize first, second, third, fourth, fifth, packages_selector
    @packages_selector = packages_selector
    @first = first
    @second = second
    @third = third
    @fourth = fourth
    @fifth = fifth
  end

  def calculate_books_price
    number_of_books = @first + @second + @third + @fourth + @fifth
    books_list = [@first, @second, @third, @fourth, @fifth]

    highests_discounts_sets_of_books = 
    @packages_selector.create_books_packages_with_highest_total_discount books_list
    
    calculate_total_amount highests_discounts_sets_of_books
  end

  def calculate_total_amount sets_of_books
    (sets_of_books[0] + sets_of_books[1]*0.95*2 + sets_of_books[2]*0.90*3 + 
      sets_of_books[3]*0.80*4 + sets_of_books[4]*0.75*5)*BOOK_PRICE
  end

end