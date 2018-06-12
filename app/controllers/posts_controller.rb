class PostsController < ApplicationController
  before_action :authenticate_admin!, except: [:index, :show]
  before_action :find_post, only: [:edit, :update, :show, :delete]

  # index action renders all posts
  def index
    @posts = Post.all
  end

  # new action creates new post
  def new
    @post = Post.new
  end

  # create action saves post to database
  def create
    @post = Post.new
    if @post.save(post_params)
      flash[:notice] = "Successfully created post!"
      redirect_to post_path(@post)
    else
      flash[:alert] = "Error creaing post!"
      render :new
    end
  end

    # edit action retrieves post and renders it to edit page
  def edit
  end

  # update action updates post with the new info
  def update
    if @post.update_attributes(post_params)
      flash[:notice] = "Successfully updated post!"
      redirect_to post_path(@posts)
    else
      flash[:alert] = "Error updating post!"
  end
end

  # show action renders the individual post retrieving the id
  def show
  end

  # destroy action removes post permanently from the database
  def destroy
    if @post.destroy
      flash[:notice] = "Successfully deleted post!"
      redirect_to posts_path
    else
      flash[:alert] = "Error updating post!"
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
