class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if current_user.posts.create(post_params)
      redirect_to root_url
    else
      @errors = @post.errors.full_messages
      render "new"
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to root_url
    else
      @errors = @post.errors.full_messages
      render "edit"
    end
  end

  def destroy
    Post.find(params[:id]).destroy
    flash[:success] = "Post Deleted"
    redirect_to root_url
  end

  private

    def post_params
      params.require(:post).permit(:title, :content)
    end

end
