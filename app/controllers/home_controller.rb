class HomeController < ApplicationController
    def index
        @discussions = Discussion.paginate(page: params[:page], per_page: 9).order('created_at desc')
        @forums = Forum.all
    end
end
