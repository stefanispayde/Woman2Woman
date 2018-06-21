class PostsController < ApplicationController
  before_action :authenticate_admin!, except: [:index, :show]
  before_action :find_post, only: [:edit, :update, :show, :delete]

  # renders all posts
  def index
    if params[:category].blank?
      @posts = Post.all.order("created_at DESC")#.paginate(page: params[:page], per_page: 6)

    else
      @category_id = Category.find_by(name: params[:category]).id
      @posts = Post.where(category_id: @category_id).order('created_at DESC')
    end
  end

  # creates new post
  def new
    @post = Post.new
end

  # saves post to database
  def create
    @post = Post.new(post_params)
    # byebug
    if @post.valid?
      @post.save
      flash[:notice] = "Successfully created post!"
      redirect_to(@post)
    else
      flash[:alert] = "Error creating post!"
      render :new
    end
  end

    #  retrieves post and renders it to edit page
  def edit
    @post = Post.find(params[:id])
  end

  # updates post with the new info
  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
      flash[:notice] = "Successfully updated post!"
      redirect_to (@post)
end

  #renders the individual post retrieving the id
  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comment.post_id = @post.id

  end

  # removes post permanently from the database
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
    params.require(:post).permit(:title, :body, :category_id, :image)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
