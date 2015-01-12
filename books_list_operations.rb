class Books_list_operations

  def count_different_books books_list
    different_books_counter = 0
     books_list.each do |number_of_copies_of_the_book|
      if number_of_copies_of_the_book != 0
        different_books_counter += 1
      end
    end
    different_books_counter
  end

  def pick_set_of_books books_list
    rest_of_books_list = []
    books_list.each do |book|
      if book-1 != 0
        rest_of_books_list.push(book-1)
      end
    end
    rest_of_books_list
  end

end