require 'random_data'

50.time do
    Post.create!(
        title: RandomData.random_sentence,
        body: RandomData.random_paragraph
        )
end

posts = Post.all

100.times do
    Comment.create!(
        post: posts.sample,
        body: RandomData.random_paragraph
        )
    end
    
puts "Seed finished"
puts "#{Posts.count} posts created"
puts "#{Comment.count} Comments created"