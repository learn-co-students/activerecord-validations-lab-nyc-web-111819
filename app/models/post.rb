class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(Fiction fiction Non-Fiction nonfiction non-fiction) }
    validate :clickbaity

    def clickbaity
        if self.title && !self.title.downcase.include?("won't believe" || "secret" || "guess")
            self.errors.add(:title, "has to include 'won't believe' 'secret' 'top [number]' 'guess'")


    end

end
end
