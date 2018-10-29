class ArticlesController < ApplicationController

  
  def new
    @article = Article.new  
  end
  
  def create
    #@article.save
    #redirect_to articles_path(@article)
    
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "Article was succesfully saved."
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end
  
  def show
    @article = Article.find(params[:id])
  end
  
  private
  
    def article_params
      params.require(:article).permit(:title, :description)
    end
    
end
