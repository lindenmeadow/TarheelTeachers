class CommentsController < ApplicationController
  
  def index 
    @discussion = Discussion.find(params[:discussion_id])
    @comments = @discussion.comments
  end

  def create
    @comment = current_user.comments.build(comment_params)
    
    @comment.user_id = current_user.id
    
    if @comment.valid?
      @comment.save
      redirect_to discussion_comments_path(@comment.discussion_id), flash:{notice: "Comment created!"}
    else
      redirect_to discussion_comments_path(@comment.discussion_id), flash:{notice: "Content field empty cannot be empty."}
    end
  end

  def edit
    @discussion = Discussion.find_by(params[:id])
    @comment = Comment.find(params[:id])
  end

  def show 
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.valid? 
      @comment.update(comment_params)
      redirect_to discussion_comments_path(@comment.discussion_id), flash:{notice: "Comment updated."}
    else
      redirect_to edit_comment_path, flash:{notice: "Content field cannot be empty."}
    end
  end

  def destroy
     @comment = Comment.find(params[:id])
     @comment.destroy
     redirect_to discussion_comments_path(@comment.discussion_id), flash:{notice: "Comment deleted."}
    
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :username, :discussion_id, :content)
  end
end
