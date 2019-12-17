class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: { in: %w(Fiction fiction Non-Fiction non-fiction nonfiction) }

    validate :clickbaity 

    def clickbaity
        # my_number >= 0
        if self.title && !self.title.downcase.include?("won't believe" || "secret"|| "guess")
            self.errors.add(:title, " has to include 'won't believe' or 'secret'or 'top [number]' or 'guess' ")
        end
    end

end
