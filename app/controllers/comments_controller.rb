class CommentsController < ApplicationController
  before_action :set_article
  before_action :set_comment, only: [:edit, :update, :destroy]

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params.merge(user_id: current_user.id))
    redirect_to article_path(@article)
  end

  def destroy
    @comment.destroy
    redirect_to article_path(@article), status: :see_other
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to article_path(@article)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  def set_article
    @article = Article.find(params[:article_id])
  end

  def set_comment
    @comment = @article.comments.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "The comment you are looking for could not be found"
    redirect_to article_path(@article)
  end

  def comment_params
    params.require(:comment).permit(:commenter, :body, :status)
  end
end
