require_dependency "ticket_it/application_controller"

module TicketIt
  class CommentsController < ApplicationController

    def create
      @comment = Comment.new(comment_params)
      @comment.commenter = ticketit_user
      respond_to do |format|
        if @comment.save
          format.html{redirect_back(fallback_location: polymorphic_url(@comment.commentable), notice: 'Commented!')}
          format.js{}
          format.json{render json: @comment.to_json}
        else
          format.html{redirect_back(fallback_location: polymorphic_url(@comment.commentable), notice: 'Failed to post a commented!')}
          format.js{}
          format.json{render json: @comment.to_json}
        end
      end
    end

    private
    def comment_params
      params.require(:comment).permit(:commenter_id, :commenter_type, :commentable_type, :commentable_id, :content)
    end

  end
end
