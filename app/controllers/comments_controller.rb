class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params.merge(user_id: current_user.id))
    redirect_to article_path(@article)
  end

  def destroy
    if current_user.blank?
      render plain: "You must be logged in to delete a comment", status: :unauthorized
    else
      @article = Article.find(comment_params[:article_id])
      @comment = @article.comments.find(comment_params[:id])
      @comment.destroy
      redirect_to article_path(@article), status: :see_other
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:commenter, :body, :status)
  end
end
