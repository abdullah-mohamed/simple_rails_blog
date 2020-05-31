class ArticlesController < ApplicationController
    
    def index
        @articles = Article.paginate(page: params[:page], per_page: 2)
    end

    def show
        @article = Article.find(params[:id])
    end

    def new
        require_user
        @article = Article.new
    end

    def edit
        require_user
        @article = Article.find(params[:id])
        authorize_user
    end

    def create
        require_user
        @article = Article.new(article_params)
        authorize_user
        @article.user = current_user
        if @article.save
            redirect_to @article
        else
            render 'new'
        end
    end

    def update
        require_user
        @article = Article.find(params[:id])
        authorize_user
        if(@article.update(article_params))
            redirect_to @article
        else
            render 'edit'
        end
    end

    def destroy
        require_user
        @article = Article.find(params[:id])
        authorize_user
        @article.destroy
        redirect_to articles_path
    end

private
    def article_params
        params.require(:article).permit(:title, :text)
    end

    def authorize_user
        if current_user != @article.user
            flash[:danger] = "You aren't authorized to perform this action"
            redirect_to root_path
        end
    end
end
