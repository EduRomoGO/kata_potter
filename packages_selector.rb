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

  def remove_empty_book_types_from_books_list books_list
    books_list_to_buy = []
    books_list.each do |number_of_copies_of_the_book|
      if number_of_copies_of_the_book != 0
        books_list_to_buy.push(number_of_copies_of_the_book)
      end
    end
    books_list_to_buy
  end

  def create_books_packages_with_highest_total_discount books_list
    sets_of_books = [0,0,0,0,0]

    books_list_to_buy = remove_empty_book_types_from_books_list books_list
    different_books_counter = count_different_books books_list_to_buy

    if different_books_counter == 1
      sets_of_books[0] = books_list_to_buy[0]
      different_books_counter = 0
    end

    while different_books_counter > 0
      books_list_to_buy = pick_set_of_books books_list_to_buy
      sets_of_books[different_books_counter-1] += 1
      different_books_counter = count_different_books books_list_to_buy
    end

    change_sets_to_obtain_more_discount sets_of_books
  end

  def change_sets_to_obtain_more_discount sets_of_books
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