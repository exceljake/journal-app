require "test_helper"

class CategoryTest < ActiveSupport::TestCase
include Devise::Test::IntegrationHelpers

def setup
    @user = users(:one)
      sign_in users(:one)
    @category = categories(:one)
end
    test "should reject a category without a name" do
      @category.name = ''
      @category.user_id = 1
      assert_not @category.valid?
    end

    test "should reject a category without a details" do
      @category.details = ''
      assert_not @category.valid?
    end

    test "should reject a category with a name longer than 20 chars" do
      @category.name = 'a' * 21
      assert_not @category.valid?
    end

    test "should reject a category with a details shorter than 5 chars" do 
      @category.details = 'a' * 4
      assert_not @category.valid?
    end

    test "should reject a category with a details longer than 50 chars" do 
      @category.details = 'a' * 51
      assert_not @category.valid?
    end

    # ask sir how to make a test regarding uniqueness

  def test_task_association 
    @category = Category.create(name: "Personal")

    assert_equal @category.tasks.length, 0
  end

end
