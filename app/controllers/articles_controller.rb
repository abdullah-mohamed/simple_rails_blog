class ArticlesController < ApplicationController
    # Uupdate: before_action: check_login
    # Uupdate : before_edit: check auth
    # Uupdate : before_delete: check auth

    def index
        @articles = Article.all
    end

    def show
        @article = Article.find(params[:id])
    end

    def new
        @article = Article.new
    end

    def edit
        @article = Article.find(params[:id])
    end

    def create
        @article = Article.new(article_params)
        @article.user = User.first          # MUST BE UPDATED
        if @article.save
            redirect_to @article
        else
            render 'new'
        end
    end

    def update
        @article = Article.find(params[:id])

        if(@article.update(article_params))
            redirect_to @article
        else
            render 'edit'
        end
    end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy

        redirect_to articles_path
    end

private
    def article_params
        # Uupdate : require user logged in
        # params.require(:user).permit(:logged_in)
        params.require(:article).permit(:title, :text)
    end
end
