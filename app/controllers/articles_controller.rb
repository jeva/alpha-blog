class ArticlesController < ApplicationController

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
      flash[:notice] = "Article was succesfully saved."
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end
  
  def show
    @article = Article.find(params[:id])
     #@article = Article.all
  end
  
  def edit
    @article = Article.find(params[:id])
  end
  
  def update
   @article = Article.find(params[:id])
   
   if @article.update(article_params)
    flash[:notice] = "Article is sucessfuly updated."
    redirect_to article_path(@article)
   else
    render 'edit'
   end
  end
  
  def destroy
    @article = Article.find(params[:id])
  
    if @article.destroy
      flash[:notice] = "Article has been succesfully deleted."
    else
       flash[:notice] = "Something went during during the process"
    end
  
    redirect_to articles_path(@article)
  end
  
  
  
  private
  
    def article_params
      params.require(:article).permit(:title, :description)
    end
    
end
