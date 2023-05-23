module Validator
    def Validator.validate_string(str)
        if str.empty?
            return nil
        else
            flag = true
            (0...str.length).each do |i|
                if str != ' '
                    flag = false
                    return true
            end
            return !flag
        end
    end
end

puts Validator.validate_string("  gk")