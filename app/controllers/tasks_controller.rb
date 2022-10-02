class TasksController < ApplicationController  
    before_action :get_category
    before_action :get_task, only: ['show', 'edit', 'update', 'destroy']


    def index  
        @tasks = @category.tasks
    end

    def new 
        @task = @category.tasks.build
    end

    def create 
        @task = @category.tasks.build(task_params)
        @task.user_id = current_user.id
        if @task.save
            redirect_to category_tasks_path
        else
            render :new
        end
    end

    def show
        
    end

    def edit
        
    end

    def update
        respond_to do |format|
            if @task.update(task_params)
              format.html { redirect_to category_task_path(@category.id, @task.id), notice: "Task was successfully updated." }
              format.json { render :show, status: :ok, location: @task }
            else
              format.html { render :edit, status: :unprocessable_entity }
              format.json { render json: @task.errors, status: :unprocessable_entity }
            end
          end
    end

    def destroy
        @task.destroy

        respond_to do |format|
          format.html { redirect_to category_tasks_path(@category.id), notice: "Task was successfully destroyed.", status: :see_other
        }
          format.json { head :no_content }
        end
    end



    private

    def get_category
        @category = Category.find(params[:category_id])
    end

    def get_task 
        @task = Task.find(params[:id])
    end

    def task_params
        params.require(:task).permit(:name, :description, :deadline)
    end
end
