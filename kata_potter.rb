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

    books_list_to_buy = remove_empty_book_types_from_books_list books_list

    sets_of_books = @packages_selector.create_books_packages_with_highest_total_discount books_list_to_buy
    calculate_total_amount sets_of_books
  end

  def remove_empty_book_types_from_books_list books_list
    books_list_to_buy = []
    books_list.each do |number_of_copies_of_the_book|
      if number_of_copies_of_the_book != 0
        books_list_to_buy.push(number_of_copies_of_the_book)
      end
    end
    books_list_to_buy
  end

  def calculate_total_amount sets_of_books
    (sets_of_books[0] + sets_of_books[1]*0.95*2 + sets_of_books[2]*0.90*3 + 
      sets_of_books[3]*0.80*4 + sets_of_books[4]*0.75*5)*BOOK_PRICE
  end

end

class Packages_selector

  def count_different_books books_list_to_buy
    different_books_counter = 0
     books_list_to_buy.each do |number_of_copies_of_the_book|
      if number_of_copies_of_the_book != 0
        different_books_counter += 1
      end
    end
    different_books_counter
  end

  def create_books_packages_with_highest_total_discount books_list_to_buy
    sets_of_books = [0,0,0,0,0]

    different_books_counter = count_different_books books_list_to_buy

    while different_books_counter != 0
      if different_books_counter == 1
        sets_of_books[0] = books_list_to_buy[0]
        different_books_counter = 0
      else
        books_list_to_buy = pick_set_of_books books_list_to_buy
        sets_of_books[different_books_counter-1] += 1
        different_books_counter = count_different_books books_list_to_buy
      end
    end

    while sets_of_books[4] != 0 and sets_of_books[2] != 0
      sets_of_books[4] = sets_of_books[4]-1
      sets_of_books[2] = sets_of_books[2]-1
      sets_of_books[3] += 2
    end

    sets_of_books
  end 

  def pick_set_of_books books_list_to_buy
    rest_of_books_list = []
    
    books_list_to_buy.each do |book|
      if book-1 != 0
        rest_of_books_list.push(book-1)
      end
    end

    rest_of_books_list
  end

end