require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
    
    def setup
        @category = Category.create(name: "lifestyle")
        @user = User.create(username: "john", email: "john@ex.com", password: "password", admin: true);
    end
    
    test "Should get categories index" do
        get :index
        assert_response :success
    end

    test "Should get new" do
        #sign_in_as(@user, "password")
        session[:user_id] = @user.id
        get :new
        assert_response :success
    end

    test "Should get show" do
        #get category_path(@category)
        get :show, params: {'id': @category.id}
        assert_response :success
    end

    test "Should redirect create when not admin" do
        assert_no_difference 'Category.count' do
            post :create, params: { category: {name: "sports"}}
        end
        assert_redirected_to categories_path
    end
end  