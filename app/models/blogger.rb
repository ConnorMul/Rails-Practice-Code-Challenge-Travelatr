class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts

    validates :name, uniqueness: true
    validates :age, numericality: { greater_than: 0 }
    validates :bio, length: { minimum: 30 }

    def featured_post
      self.posts.max {|post1, post2| post1.likes <=> post2.likes }
    end

    def total_likes
        self.posts.sum { |post| post.likes }
    end
end
