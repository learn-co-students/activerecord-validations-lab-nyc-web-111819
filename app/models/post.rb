class Post < ActiveRecord::Base

    validates :title, presence: true
    validates :content, length: { minimum: 250}
    validates :summary, length: { maximum: 250}
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}


    validate :click_baity

    def click_baity
        if self.title && !self.title.downcase.include?("won't believe" || "secret" || "Top" || "Guess")
            self.errors.add(:title, "not click baity enough!!!!!")
        end
    end

end
