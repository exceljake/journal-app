require "test_helper"

class TaskTest < ActiveSupport::TestCase
  include Devise::Test::IntegrationHelpers
  def setup 
    @user = users(:one)
      sign_in users(:one)
    @category = categories(:one)
      @task = tasks(:one)
  end

  test "should reject a task without a name" do
    @task.name = ''
    assert_not @task.valid?
  end

  test "should reject a task without a description" do
    @task.description = ''
    assert_not @task.valid?
  end

  test "should reject a task with a name longer than 20 chars" do
    @task.name = 'a' * 21
    assert_not @task.valid?
  end

  test "should reject a task with a description shorter than 5 chars" do 
    @task.description = 'a' * 4
    assert_not @task.valid?
  end

  test "should reject a task with a description longer than 50 chars" do 
    @task.description = 'a' * 51
    assert_not @task.valid?
  end



  # test "the truth" do
  #   assert true
  # end

  # test "category association" do
  #   @category = Category.create name: "Personal" 
  #   @task = Task.create(category_id: @category.id)

  #   assert_equal @task.category, @category 
  # end
end
