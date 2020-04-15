class CommentsController < ApplicationController

    def new
        @comment = Comment.new
    end

    def create

    end

    def edit
        @comment = Comment.find(params[:id])
    end

    def update

    end

    private

    def comment_params
        params.require(:comment).permit(:user_id, :ride_id, :title, :content)
    end
end
