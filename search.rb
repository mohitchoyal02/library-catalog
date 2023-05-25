require "csv"

class Search
    def search_title(title)

        result = []

        csv = CSV.open("./books.csv", "r")
        csv.each do |row|
            if(row[0].include?(title))
                result.push("#{row[0]} by #{row[1]}")
            end
        end
        # p result
        return result
    end

    def search_author(author)
        result = []

        csv = CSV.open("./books.csv", "r")
        csv.each do |row|
            if(row[1].include?(author))
                result.push("#{row[0]} by #{row[1]}")
            end
        end
        # p result
        return result
    end

    def search_genre(genre)
        result = []

        csv = CSV.open("./books.csv", "r")
        csv.each do |row|
            if(row[2].include?(genre))
                result.push("#{row[0]} by #{row[1]}")
            end
        end
        # p result
        return result
    end
end