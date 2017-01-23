class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    if current_user.posts.create(post_params) 
      redirect_to root_url 
    else
      @errors = @user.errors.full_messages
      render "new"
    end
  end

  private

    def post_params
      params.require(:post).permit(:title, :content)
    end

end