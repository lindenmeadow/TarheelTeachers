class DiscussionsController < ApplicationController
  before_action :set_discussion, only: [:show, :edit, :update, :destroy]

  def index
    @discussions = Discussion.order('created_at desc').paginate(:page => params[:page], :per_page => 15)
  end

  def show
    render :show
  end

  def new
    @discussion = Discussion.new()
  end

  def edit
  end

  def create
    @discussion = current_user.discussions.build(discussion_params)

    if @discussion.save
      redirect_to @discussion, flash:{notice: "Discussion created!"}
    else
      redirect_to new_discussion_path, flash:{notice: "Please complete all fields."}
    end
  end

  def update
    if @discussion.update(discussion_params)
      redirect_to @discussion, flash:{notice: "Discussion updated."}
    else
      redirect_to edit_discussion_path, flash:{notice: "Please complete all fields."}
    end
  end

  def destroy
    @discussion.destroy
    redirect_to root_path, flash:{notice: "Discussion deleted."}
  end

  private

  def set_discussion
    @discussion = Discussion.find(params[:id])
  end

  def discussion_params
    params.require(:discussion).permit(:title, :content, :forum_id, :user_id)
  end
end
