class CommentsController < ApplicationController

    def new
        @comment = Comment.new
    end

    def create
        @comment = Comment.new(comment_params)
        if @comment.save
            redirect_to rides_path(@comment.ride_id)
        else
            render :new
        end
    end

    def edit
        @comment = Comment.find(params[:id])
    end

    def update
        @comment = Comment.find(params[:id])
        if @comment.update(comment_params)
            redirect_to rides_path(@comment.ride_id)
        else
            render :edit
        end
    end

    def destroy

    end

    private

    def comment_params
        params.require(:comment).permit(:user_id, :ride_id, :title, :content)
    end
end
