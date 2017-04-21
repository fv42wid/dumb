class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = current_user.comments.build(comment_params)
    @shit = Shit.find(params[:shit_id])
    @comment.shit = @shit
    if @comment.save
      flash[:success] = "Comment submitted!"
      redirect_to @shit
    else
      flash[:warning] = "There was a problem submitting your comment"
      redirect_to @shit
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:body)
    end
end
