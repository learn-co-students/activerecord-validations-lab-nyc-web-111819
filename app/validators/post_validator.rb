class PostValidator < ActiveModel::Validator
    def validate(post)
        ["Won't Believe" , "Secret", "Top" , "Guess"].each do |item|
            if post.title != nil
                if post.title.include? item
                    post.errors[:name]
                    return true
                end
            end
        end
        return false
    end
end