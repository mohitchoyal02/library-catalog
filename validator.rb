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
    def valid_year (year)
        pattern = /^\d{4}$/
        matches = year.match?(pattern)
        puts matches
        if(matches)
            return true
        else
            return false
        end
    end
end
