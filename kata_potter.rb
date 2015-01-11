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
    different_books_counter = count_different_books books_list, books_list_to_buy

    if books_list_elegible_for_discount? different_books_counter
      calculate_price_when_discount_applies books_list_to_buy, number_of_books, different_books_counter
    else
      number_of_books * BOOK_PRICE       
    end

  end

  def count_different_books books_list, books_list_to_buy
    different_books_counter = 0
     books_list.each do |number_of_copies_of_the_book|
      if number_of_copies_of_the_book != 0
        different_books_counter += 1
        books_list_to_buy.push(number_of_copies_of_the_book)
      end
    end
    different_books_counter
  end


  def books_list_elegible_for_discount? different_books_counter
    if (different_books_counter == 2 or different_books_counter == 3) then true else false end
  end


  def calculate_price_when_discount_applies books_list_to_buy, number_of_books, different_books_counter

      total_price = 0
      books_list_ordered = books_list_to_buy.sort
      if different_books_counter == 2
        pack_of_books_to_apply_discount_of_2 = books_list_ordered[0]*2
        pack_of_books_normal_price = number_of_books - pack_of_books_to_apply_discount_of_2
        total_price =  (pack_of_books_to_apply_discount_of_2 * BOOK_PRICE) * 0.95 + pack_of_books_normal_price * BOOK_PRICE
      elsif different_books_counter == 3
        pack_of_books_to_apply_discount_of_3 = books_list_ordered[0]*3
        pack_of_books_normal_price = number_of_books - pack_of_books_to_apply_discount_of_3
        total_price =  (pack_of_books_to_apply_discount_of_3 * BOOK_PRICE) * 0.90 + pack_of_books_normal_price * BOOK_PRICE
      end
      total_price
     

  end


end





