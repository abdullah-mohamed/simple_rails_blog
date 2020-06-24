require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
    
    def setup
        @category = Category.create(name: "lifestyle")
    end
    
    test "Should get categories index" do
        get :index
        assert_response :success
    end

    test "Should get new" do
        get :new
        assert_response :success
    end

    test "Should get show" do
        #get category_path(@category)
        get :show, params: {'id': @category.id}
        assert_response :success
    end
end  