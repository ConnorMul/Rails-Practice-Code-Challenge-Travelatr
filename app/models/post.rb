class Post < ApplicationRecord
    belongs_to :blogger
    belongs_to :destination

    validates :content, length: { minimum: 100 }
    validates :title, presence: true

    def increment_likes
        self.likes + 1
    end
end
