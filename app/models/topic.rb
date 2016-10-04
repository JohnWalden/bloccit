class Topic < ActiveRecord::Base
    has_many :posts, :SponsoredPost, dependent: :destroy
end
