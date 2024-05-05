class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    if current_user.blank?
      render plain: "You must be logged in to create an article", status: :unauthorized
    else
      @article = Article.new
    end
  end

  def create
    if current_user.blank?
      render plain: "You must be logged in to create an article", status: :unauthorized
    else
      @article = Article.new(article_params)

      if @article.save
        redirect_to @article
      else
        render :new, status: :unprocessable_entity
      end
    end
  end

  def edit
    if current_user.blank?
      render plain: "You must be logged in to edit an article", status: :unauthorized
    else
      @article = Article.find(params[:id])
    end
  end

  def update
    if current_user.blank?
      render plain: "You must be logged in to edit an article", status: :unauthorized
    else
      @article = Article.find(params[:id])

      if @article.update(article_params)
        redirect_to @article
      else
        render :edit, status: :unprocessable_entity
      end
    end
  end

  def destroy
    if current_user.blank?
      render plain: "You must be logged in to delete an article", status: :unauthorized
    else
      @article = Article.find(params[:id])
      @article.destroy

      redirect_to root_path, status: :see_other
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, :status)
  end


end
