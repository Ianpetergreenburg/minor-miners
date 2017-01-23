class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
    @user = User.find(params[:user_id])
  end

  def create
    @post = Post.create(post_params)
    if @post.persisted?
      redirect_to action: show
    else
      render "new"
    end
  end
end
