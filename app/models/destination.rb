class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

    def most_recent_posts
        self.posts.last(5)
    end

    def featured_post
        self.posts.max {|post1, post2| post1.likes <=> post2.likes }
    end

    def average_blogger_age
        self.bloggers.sum {|blogger| blogger.age } / self.bloggers.count
    end

end
