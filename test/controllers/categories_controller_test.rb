require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest
include Devise::Test::IntegrationHelpers

    def setup
          @user = users(:one)
            sign_in users(:one)
          @category = categories(:one)
    end

    test "should get index" do
        get categories_path
        assert_response :success
    end

    test "should get new" do
        get new_category_path
        assert_response :success
      end   

    test "should get show" do 
        get category_path(@category)
        assert_response :success 
    end

    test "should get edit" do
        get edit_category_path @category
        assert_response :success
    end

     test "should delete a category" do
        assert_difference('Category.count', -1) do
         delete category_path @category
        end
    end
    
    test "should be able to create a category" do
        assert_difference('Category.count', 1) do
          post categories_path, params: { category: { 
            name: 'Category Three',
            details: "a"*10
          } } 
        end
    
        assert_redirected_to categories_path
      end

      test "should render edit if update name or details is blank" do 
        patch category_path(@category), params: {category: {
          name: ''
        }}

        assert_response 422

      end

      test "should not be able to create if name or details is missing" do 
        post categories_path, params: {category: {
          name: ''
        }}
        assert_response 200
      end
    
      test "should be able to update category name" do
          patch category_path(@category), params: {
            category: { name: 'category updated' }
          }
        
            assert Category.find(@category.id).name == 'category updated' 
      end

      test "should be able to update category details" do
        patch category_path(@category), params: {
          category: { details: 'details updated' }
        }
        
          assert Category.find(@category.id).details == 'details updated'
      end


      test "should redirect to category_path if update is success" do 
        patch category_path(@category), params: {
            category: { name: 'category updated' }
          }

        assert_redirected_to category_path(@category)
      end
    
end