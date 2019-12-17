class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250}
    validates :summary, length: { maximum: 250}
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}

    validate :sufficient_clickbaitiness

    def sufficient_clickbaitiness
        
        if self.title && self.title.include?("Won't Believe" || "Secret" || "Top [number]" || "Guess")
        else
            self.errors.add(:title, "Make your title more interesting!")
        end
    end

end
