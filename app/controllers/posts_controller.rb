class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    p params
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
    @user = User.find(params[:user_id])
  end

  def create
    @user = User.find(params[:user_id])
    @post = Post.create(post_params)
    if @post.persisted?
      redirect_to action: "show", id: @post.id
    else
      render "new"
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :author_id)
  end
end
