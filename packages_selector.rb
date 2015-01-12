require './books_list_operations'

class Packages_selector

  def initialize books_list_operations
    @books_list_operations = books_list_operations
  end

  def create_books_packages_with_highest_total_discount books_list
    sets_of_books = [0,0,0,0,0]

    different_books_counter = @books_list_operations.count_different_books books_list

    while different_books_counter != 0
      books_list = @books_list_operations.pick_set_of_books books_list
      sets_of_books[different_books_counter-1] += 1
      different_books_counter = @books_list_operations.count_different_books books_list
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

end