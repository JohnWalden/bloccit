class PostsController < ApplicationController
  def index
    @posts = Post.all
    @posts.each_with_index do |post, index|
      post.title = "Bad Word's, Don't Look!"
    end
  end

  def show
  end

  def new
  end

  def edit
  end
  
  def offensivewords
  end
end
