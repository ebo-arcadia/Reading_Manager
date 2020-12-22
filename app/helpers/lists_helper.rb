module ListsHelper

    def a_reader_or_all_readers_reading_list
        if @reader
          content_tag(:h1, "#{@reader.username}'s reading list:")
        else
          content_tag(:h1, "All reading lists")
        end
      end

end
