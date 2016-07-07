module OffensiveWords
    
    def badword  
       i = 0    
       while i < @posts.length
            if @posts[i] % 5 == 4
                @post.changetitle[i]
            end
            i += 1
        end    
    end
    
    def changetitle
        rename_title :old_title_name, :new_title_name
        
    end
        
end