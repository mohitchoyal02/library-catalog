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
end


puts Validator.validate_string("    m")
