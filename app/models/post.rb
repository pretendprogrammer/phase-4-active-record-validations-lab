class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
    validate :must_not_be_clickbait

    def must_not_be_clickbait
        unless title != "True Facts"
          errors.add(:title, "That's BS.")
        end
    end
end
