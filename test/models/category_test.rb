require 'test_helper'

class Category_test < ActiveSupport::TestCase

    def setup
        @category = Category.new(name: "sports")
    end

    test "Category should be valid" do
        assert @category.valid?
    end

    test "Category should have name" do
        @category.name = " "
        assert_not @category.valid?
    end

    test "Category name should be unique" do
        @category.save
        @category2 = Category.new(name: "sports")
        assert_not @category2.valid?
    end

    test "Name shouldn't be too long" do 
        @category.name = "a" * 26
        assert_not @category.valid?
    end

    test "Name shouldn't be too short" do
        @category.name = "asds"
        assert_not @category.valid?
    end
end