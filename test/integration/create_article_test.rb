require 'test_helper'

class CreateArticleTest < ActionDispatch::IntegrationTest

    def setup
        @user = User.create({username: "john", email: "john@ex.com", password: "password"})
    end

    test "User can create article" do
        sign_in_as(@user, "password")
        get new_article_path
        assert_template 'articles/new'        # needed to install a new package for this
        assert_difference 'Article.count', 1 do
            post articles_path, params: { article: {title: "Free udemy", body: "asdkvsdknvasdvlnasldjfnlasndfasdfasdfas"} }
            follow_redirect!
        end
        assert_template 'articles/show'
        assert_match "Free udemy", response.body
    end
    
end