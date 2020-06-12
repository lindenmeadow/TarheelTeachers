class ForumsController < ApplicationController
    before_action :set_forum, only: [:show, :edit, :update, :destroy]

  def index
    @forums = Forum.all
  end

  def show
  end

  def new
    @forum = Forum.new
  end

  def edit
  end

  def create 
    @forum = Forum.new(forum_params)

    if @forum.save
      redirect_to forums_path, flash:{notice: "New forum created."}
    else
      redirect_to new_forum_path, flash:{notice: "Enter a forum name."}
    end
  end

  def update 
    if @forum.update(forum_params)
      redirect_to @forum, flash:{notice: "Forum name updated."}
    else
      redirect_to edit_forum_path, flash:{notice: "Enter a forum name."}
    end
  end

  def destroy
    @forum.destroy
    redirect_to forums_path, flash:{notice: "Forum deleted."}
  end

  private

  def set_forum
    @forum = Forum.find(params[:id])
  end

  def forum_params
    params.require(:forum).permit(:forum_name)
  end
end
