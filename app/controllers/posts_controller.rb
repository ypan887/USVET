class PostsController < ApplicationController
  def show
    load_post
  end

private
  def load_posts
    @posts ||= Post.all
  end

  def load_post
    @post ||= Post.all.find(params[:id])
  end
end