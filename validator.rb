module Validator
    def Validator.validate_string(str)
        if str.empty?
            return false
        else
            flag = true
            (0...str.length).each do |i|
                if str[i] != ' '
                    flag = false
                    return true
                end
            end
            return !flag
        end
    end

    def Validator.valid_year(year)
       begin
            pattern = /^\d{4}$/
            matches = pattern =~ year
            if(matches)
                return true
            end
            return false
        rescue
            puts "Error!!!"
        end
    end

    def Validator.validate_book(title)
        begin
            flag = true
            csv_table = CSV.table("./books.csv", converters: :all)
            csv_table.find  do |row|
                if row.field(:title) == title
                    # puts "Book with title '#{title}' already exists in catalog"
                    flag = false
                end
            end
            if flag
                # CSV.open('books.csv', "ab") do |book|
                #     book << [title, author, genre, year_published]
                # end
                # puts("Book added successfully!")
                return true
            end
            return false
        rescue
            puts "Error"
        end
    end
end