$LOAD_PATH << "../"
require 'csv'
require './validator.rb'
require './search.rb'

class Library
    def add_book(title, author, genre, year_published)
        # b = Book.new(title, author, genre, year_published)

        title = title.capitalize
        title.strip

        author = author.capitalize
        author = author.strip

        genre = genre.capitalize
        genre = genre.strip

        if Validator.validate_book(title)
            CSV.open('books.csv', "ab") do |book|
                book << [title, author, genre, year_published]
            end
            puts("Book added successfully!")
        else
            puts "Book with title '#{title}' already exists in catalog"
        end
    end

    def search_by_title(title)
        title = title.capitalize
        title = title.strip
        
        search = Search.new

        begin
            result = search.search_by_title(title)
            return result
        rescue
            return nil
        end
    end

    def search_by_author(author)
        author = author.capitalize
        author = author.strip

        begin
            csv_table = CSV.table("./books.csv", converters: :all)
            result = csv_table.find  do |row|
                row.field(:author) == author
            end
            return result
        rescue
            return nil
        end
    end

    def search_by_genre(genre)
        genre = genre.capitalize
        genre = genre.strip

        begin
            csv_table = CSV.table("./books.csv", converters: :all)
            result = csv_table.find  do |row|
                row.field(:genre) == genre
            end
            return result
        rescue
            return nil
        end
    end

    def display_catalog
        csv_table = CSV.table("./books.csv", converters: :all)
        result = []
        csv_table.each do |book|
            result << book
        end
        return csv_table
    end

    def update_book(title)
        
        title = title.capitalize
        title = title.strip
        # puts title

        found = false

        csv_table = CSV.table("./books.csv", converters: :all)
        result = csv_table.find  do |row|
            if row.field(:title) == title
                updated_row = row
                puts "Found"
                found = true
                break
            end
        end
        
        if found
            try = 0;
            flag = true

            if flag
            begin
                print "\nEnter the new title for book: "
                new_title = gets.chomp
                new_title = new_title.capitalize
                new_title = new_title.strip
                if(!Validator.validate_string(new_title))
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
                print "Enter the new author for book: "
                new_author = gets.chomp
                new_author = new_author.capitalize
                new_author = new_author.strip
                if !Validator.validate_string(new_author)
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
                print "Enter the new genre for book: "
                new_genre = gets.chomp
                new_genre = new_genre.capitalize
                new_genre = new_genre.strip

                if !Validator.validate_string(new_genre)
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
                print "Enter the new Year of Publish of book: "
                new_year = gets.chomp
                new_year = new_year.strip

                # puts Validator.valid_year(year)

                if !Validator.valid_year(new_year)
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
                updated_row = [new_title, new_author, new_genre, new_year]
                rows = CSV.read("./books.csv")

                rows.each do |row|
                    if row[0] == title
                        row.replace(updated_row)
                    end
                end

                CSV.open("./books.csv", "w") do |csv|
                    rows.each do |row|
                        csv << row
                    end
                end

                puts "Book Updated from #{title} to #{new_title}"

            end
        else
            puts "Book with '#{title}' not Found, Please Try Again."
        end
    end

    def delete_book (title)
        title = title.capitalize
        title = title.strip

        found = false

        csv_table = CSV.table("./books.csv", converters: :all)
        result = csv_table.find  do |row|
            if row.field(:title) == title
                updated_row = row
                puts "Found"
                found = true
                break
            end
        end

        if found
            csv = CSV.read("./books.csv")
            # csv.each do |row|
            #     row.delete_if do |r|
            #         r == title
            #     end
            # end
            CSV.open("./books.csv", "w") do |new_csv|
                csv.each do |row|
                    if row[0] != title
                        new_csv << row
                    end
                end
            end
            puts "Book '#{title}' has been Deleted.\n  "
        else
            puts "Book with '#{title}' not Found, Please Try Again."
        end

    end
end
