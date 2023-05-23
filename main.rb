$LOAD_PATH << './Classes'
require "Library.rb"



def display_main_menu

    puts("\nMain Menu:")
    puts("1. Add a book")
    puts("2. Search by Title")
    puts("3. Search by Author")
    puts("4. Search by Genre")
    puts("5. Display Catalog")
    puts("6. Exit")

    print("Please enter your choice: ")

end

def add_book_menu
    print "Enter the title of the book: "
    title = gets.chomp

    print "Enter the author of the book: "
    author = gets.chomp

    print "Enter the genre of the book: "
    genre = gets.chomp

    print "Enter the year published: "
    year = gets.chomp


    lib = Library.new

    lib.add_book(title, author, genre, year)



    display_main_menu
end

def title_menu
    print "Enter the title to search for: "
    title = gets.chomp

    lib = Library.new
    result = lib.search_by_title(title)

    puts "Books match the title '#{title.capitalize}':"
    puts "#{result[0]} by #{result[1]}"

    display_main_menu
end

def author_menu
    print "Enter the author to search for: "
    author = gets.chomp

    lib = Library.new
    result = lib.search_by_author(author)

    puts "Books matching the author '#{author.capitalize}':"
    puts "#{result[0]} by #{result[1]}"

    display_main_menu
end

def genre_menu
    print "Enter the genre to search for: "
    genre = gets.chomp

    lib = Library.new
    result = lib.search_by_genre(genre)

    # puts "Books matching the genre '#{genre.capitalize}':"
    # puts "#{result[0]} by #{result[1]}"

    display_main_menu
end

def display_catalog
    lib = Library.new
    result = lib.display_catalog

    i = 0

    puts "    Title          Author          Genre          Year Published"
    puts "-------------------------------------------------------------------------"

    result.each do |row|
       arr = "#{row}".split(',')
       puts "     #{arr[0]}           #{arr[1]}               #{arr[2]}          #{arr[3]}\n"
    end

    display_main_menu
end

 


def start
    puts "Welcome to the Library Catalog!"
    display_main_menu
    loop do
        input = gets.chomp.to_i
        case input
        when 1
            add_book_menu
        when 2
            title_menu
        when 3
            author_menu
        when 4
            genre_menu
        when 5
            display_catalog
        when 6
            puts "Goodbye!"
            break
        else
            puts "Please Enter Valid Option"
            display_main_menu
        end
    end
end



start