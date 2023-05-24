require "./Menu.rb"


class Starter
    def start
        puts "Welcome to the Library Catalog!"
        Menu.display_main_menu
        loop do
            input = gets.chomp.to_i
            case input
            when 1
                Menu.add_book_menu
            when 2
                Menu.title_menu
            when 3
                Menu.author_menu
            when 4
                Menu.genre_menu
            when 5
                Menu.display_catalog
            when 6
                Menu.update_book_menu
            when 7
                Menu.delete_book_menu
            when 8
                puts "Goodbye!"
                break
            else
                puts "Please Enter Valid Option"
                Menu.display_main_menu
            end
        end
    end
end    


s = Starter.new
s.start
