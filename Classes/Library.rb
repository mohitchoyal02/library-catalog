$LOAD_PATH << "./Classes"
require "Book.rb"
require 'csv'

class Library
    def add_book(title, author, genre, year_published)
        # b = Book.new(title, author, genre, year_published)

        title = title.capitalize
        author = author.capitalize
        genre = genre.capitalize

        CSV.open('books.csv', "ab") do |book|
            book << [title, author, genre, year_published]
        end

        puts("Book added successfully!")
    end
    
    def search_by_title(title)
        title = title.capitalize

        begin
            csv_table = CSV.table("./books.csv", converters: :all)
            result = csv_table.find  do |row|
                row.field(:title) == title
            end
            return result
        rescue
            return nil
        end
    end

    def search_by_author(author)
        author = author.capitalize

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
end