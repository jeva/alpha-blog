class ArticlesController < ApplicationController

  before_action :set_article, only: [:edit,:update,:show, :destroy]

  def index
    @article = Article.all
  end
  
  
  def new
    @article = Article.new  
  end
  
  def create
    #@article.save
    #redirect_to articles_path(@article)
    
    @article = Article.new(article_params)
    if @article.save
      flash[:success] = "Article was succesfully saved."
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end
  
  def show
     #@article = Article.all
  end
  
  def edit
  end
  
  def update
   if @article.update(article_params)
    flash[:success] = "Article is sucessfuly updated."
    redirect_to article_path(@article)
   else
    render 'edit'
   end
  end
  
  def destroy
    if @article.destroy
      flash[:danger] = "Article has been succesfully deleted."
    else
       flash[:notice] = "Something went during during the process"
    end
  
    redirect_to articles_path(@article)
  end
  
  
  
  private
  
    def article_params
      params.require(:article).permit(:title, :description)
    end
    
    def set_article
     @article = Article.find(params[:id])
    end
    
    
end
