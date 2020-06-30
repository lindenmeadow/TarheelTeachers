class HomeController < ApplicationController
    def index
        @discussions = Discussion.recent.paginate(page: params[:page], per_page: 9)
        @forums = Forum.all
    end
end
