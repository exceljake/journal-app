require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
include Devise::Test::IntegrationHelpers
    def setup
    @user = users(:one)
    sign_in users(:one)
    @category = categories(:one)
    @task = tasks(:one)

    end

    test "should get index" do
        get category_tasks_path @category
        assert_response :success
      end

    test "should get new" do
        get new_category_task_path(@category.id)
        assert_response :success
    end
    
    test "should be able to create a task" do
        old_task_count = Category.find(@category.id).tasks.length
    
        assert_difference('Task.count', 1) do
          post category_tasks_path(@category.id), params: {
            task: { name: 'Task Two', description: "This is my description for my task 2", deadline: "2022-07-18" }
          }
        end
    
        assert Category.find(@category.id).tasks.length > old_task_count
    end

    test "should render edit if update fails" do 
        patch category_task_path(@category.id, @task.id), params: {task: {
          name: ''
        }}

        assert_response 422
    end

    test "should fail create if params is missing" do 
        post category_tasks_path(@category.id, @task.id), params: {task: {
            name: ''
        }}
        assert_response 200
    end

    test "should be able to update task name" do
        patch category_task_path(@task.category_id, @task.id), 
        params: {
            task: { 
            name: 'task name updated' }
                }

        assert Task.find(@task.id).name == 'task name updated'
    end

    test "should be able to update task description" do 
        patch category_task_path(@task.category_id, @task.id), 
        params: { 
            task: {
                description: 'task description updated'
            }
        }
        assert Task.find(@task.id).description == 'task description updated'
    end

    test "should be able to delete task" do
        old_tasks_count = Category.find(@category.id).tasks.length
    
        assert_difference('Task.count', -1) do 
          delete category_task_path(@task.category_id, @task.id)
        end
    
        assert Category.find(@category.id).tasks.length < old_tasks_count
      end
end