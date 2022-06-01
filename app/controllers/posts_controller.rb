class PostsController < ApplicationController
  #add callback
  before_action :set_post, only: [:edit, :update, :show, :destory]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "Post created Successfully!"
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash[:notice] = "Post's records updated Successfully!"
      redirect_to posts_path
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @post = Post.find(params[:id])
    if@post.destroy
      flash[:notice] =  "Post has been Deleted!"
      redirect_to posts_path
    else
      flash[:error] = "Deletion Operation Failed!"
    end
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:post_title, :post_body, :image, uploads: [])
    end
end
