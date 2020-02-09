module ApplicationHelper
    
    def full_title(page_title='')
        base_title = "自衛隊に入隊したいけど不安な君へ"
        if page_title.empty?
            base_title
        else
            page_title + "|" + base_title
        end 
    end 
end
