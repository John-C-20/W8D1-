class PostsController < ApplicationController
    def new
    end

    def create
    end

    def show 
    end 

    def edit
    end

    def update
    end

    def index
    end

    private

    def post_params
        params.require(:post).permit(:title, :url, :content, :sub_id, :user_id)
        #should we pass sub_id and user_id ?
    end
end
