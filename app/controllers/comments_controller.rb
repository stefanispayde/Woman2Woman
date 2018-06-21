class CommentsController < ApplicationController

def index
  #@comment = Comment.paginate(:page => params[:page], :per_page => 3)
end


#assign post_id
def create
  @comment = Comment.new(comment_params)
  @comment.post_id = params(:post_id)

  @comment.save

  redirect_to post_path(@comment.post)
end

def comment_params
  params.require(:comment).permit(:user_name, :body)
end






end
