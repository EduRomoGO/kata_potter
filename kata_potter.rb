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

class Potter_shopping_basket

  BOOK_PRICE = 8

  def initialize first, second, third, fourth, fifth
    @first = first
    @second = second
    @third = third
    @fourth = fourth
    @fifth = fifth
  end

  def calculate_books_price

    number_of_books = @first + @second + @third + @fourth + @fifth
    books_list = [@first, @second, @third, @fourth, @fifth]

    books_list_to_buy = []
    different_books_counter = 0

    if books_list_elegible_for_discount? books_list, books_list_to_buy, different_books_counter
      calculate_price_when_discount_applies books_list_to_buy, number_of_books
    else
      number_of_books * BOOK_PRICE       
    end

  end

  def books_list_elegible_for_discount? books_list, books_list_to_buy, different_books_counter
    
    books_list.each do |number_of_copies_of_the_book|
      if number_of_copies_of_the_book != 0
        different_books_counter += 1
        books_list_to_buy.push(number_of_copies_of_the_book)
      end
    end

    if (different_books_counter == 2) then true else false end
  end


  def calculate_price_when_discount_applies books_list_to_buy, number_of_books
      books_list_ordered = books_list_to_buy.sort
      pack_of_books_to_apply_discount = books_list_ordered[0]*2
     
      pack_of_books_normal_price = number_of_books - pack_of_books_to_apply_discount
      total_price =  (pack_of_books_to_apply_discount * BOOK_PRICE) * 0.95 + pack_of_books_normal_price * BOOK_PRICE
  end


end





