require 'test_helper'

class UserSignUpTest < ActionDispatch::IntegrationTest

    test "User can sign up" do
        get new_user_path
        assert_template 'users/new'        # needed to install a new package for this
        assert_difference 'User.count', 1 do
            post users_path, params: { user: {username: "john", email: "john@ex.com", password: "password"} }
            follow_redirect!
        end
        assert_template 'users/show'
        assert_match "john", response.body
    end
    
end