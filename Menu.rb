require "./Classes/Library.rb"
require "./validator.rb"

module Menu

  def self.display_main_menu

    puts("\nMain Menu:")
    puts("1. Add a book")
    puts("2. Search by Title")
    puts("3. Search by Author")
    puts("4. Search by Genre")
    puts("5. Display Catalog")
    puts("6. Update Book")
    puts("7. Delete Book")
    puts("8. Exit")

    print("Please enter your choice: ")

  end

  def self.add_book_menu

    try = 0;
    flag = true

    if flag
      begin
        print "\nEnter the title of the book: "
        title = gets.chomp
        if(!Validator.validate_string(title))
          throw "Empty Field"
        end
      rescue Exception => e
        try += 1
        if(try!=3)
          puts "Title of Book is Empty!!!"
          retry
        else
          puts "Maximum Wrong attempt"
          flag = false
          try = 0
        end
      end
    end

    if flag
      begin
        print "Enter the author of the book: "
        author = gets.chomp
        if !Validator.validate_string(author)
          throw "Empty Field"
        end
      rescue Exception =>e
        try += 1
        if(try!=3)
          puts "Author of Book is Empty!!!"
          retry
        else
          puts "Maximum Wrong attempt"
          try = 0
          flag = false
        end
      end
    end

    if flag
      begin
        print "Enter the genre of the book: "
        genre = gets.chomp

        if !Validator.validate_string(genre)
          throw "Empty Field!!!"
        end
      rescue Exception => e
        try += 1
        if(try!=3)
          puts "Genre of Book is Empty!!!"
          retry
        else
          puts "Maximum Wrong attempt"
          try = 0
          flag = 0
        end
      end
    end

    if flag
      begin
        print "Enter the year published: "
        year = gets.chomp

        # puts Validator.valid_year(year)

        if !Validator.valid_year(year)
          throw "Empty or Wrong Entry!!!"
        end
      rescue Exception => e
        try += 1
        if(try!=3)
          puts "Year of Publish is Empty or Wrong Entry!!!"
          retry
        else
          puts "Maximum Wrong attempt"
          try = 0
          flag = false
        end
      end
    end

    if !flag
      puts "Error! Please try again later"
    else
      lib = Library.new
      lib.add_book(title, author, genre, year)
    end
    self.display_main_menu
  end

  def self.title_menu
    print "Enter the title to search for: "
    title = gets.chomp

    lib = Library.new
    result = lib.search_by_title(title)
    if result == nil
        puts "Books match the title '#{title.capitalize}' Not Found!!!"
    else
        puts "Books match the title '#{title.capitalize}':"
        puts "#{result[0]} by #{result[1]}"
    end

    self.display_main_menu
  end

  def self.author_menu
    print "Enter the author to search for: "
    author = gets.chomp

    lib = Library.new
    result = lib.search_by_author(author)

    if result == nil
        puts "Books matching the author '#{author.capitalize}' Not Found!!!"
    else
        puts "Books matching the author '#{author.capitalize}':"
        puts "#{result[0]} by #{result[1]}"
    end

    self.display_main_menu
  end

  def self.genre_menu
    print "Enter the genre to search for: "
    genre = gets.chomp

    lib = Library.new
    result = lib.search_by_genre(genre)

    if result == nil
        puts "Books matching the genre '#{genre.capitalize}' Not Found!!!"
    else
        puts "Books matching the genre '#{genre.capitalize}':"
        puts "#{result[0]} by #{result[1]}"
    end
    self.display_main_menu
  end

def self.display_catalog
    lib = Library.new
    result = lib.display_catalog

    i = 0

    puts "    Title          Author          Genre          Year Published"
    puts "-------------------------------------------------------------------------"

    result.each do |row|
       arr = "#{row}".split(',')
       puts "     #{arr[0]}           #{arr[1]}               #{arr[2]}          #{arr[3]}\n"
    end

    self.display_main_menu
  end

  def self.update_book_menu
    try = 0
    begin
      print "\nEnter the title of the book you want to update: "
      title = gets.chomp
      if(!Validator.validate_string(title))
        throw "Empty Field"
      end
    rescue Exception => e
      try += 1
      if(try!=3)
        puts "Title of Book is Empty!!!"
        retry
      else
        puts "Maximum Wrong attempt"
        flag = false
        try = 0
      end
    end

    lib = Library.new

    lib.update_book(title)

    self.display_main_menu
  end

  def self.delete_book_menu

  end
end
