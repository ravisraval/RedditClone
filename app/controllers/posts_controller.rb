class PostsController < ApplicationController
  def edit
    if @post.user_id == current_user.id
      @post = Post.find(params[:id])
    else
      flash[:errors] = ["prohibit editing from non-moderator"]
      redirect_to subs_url
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      redirect_to post_url(@post)
    else
      flash[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def update
    @post = Post.find(params[:id])

    if @post.user_id == current_user.id && @post.update_attributes(post_params)
      redirect_to post_url(@post)
    else
      flash[:errors] = @post.errors.full_messages
      render :edit
    end
  end

  def destroy
    @post = Post.find_by_id(params[:id])

    if @post.user_id == current_user.id
      @post.destroy
    else
      flash[:errors] = @post.errors.full_messages
    end
  end

  def post_params
    params.require(:post).permit(:title, :url, :content, :user_id, sub_ids: [])
  end
end
