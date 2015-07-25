module Api
  class TasksController < Api::BaseController
    before_action :correct_user, only: :destroy

    def index
      tasks = @current_user.tasks.hash_tree
      render json: tasks, root: false
    end

    def create
      if task_params[:parent_id]
        parent = @current_user.tasks.find_by(id: task_params[:parent_id])
        task = parent.children.build(task_params)
        task.user = @current_user
      else
        task = @current_user.tasks.build(task_params)
      end
      if task.save
        render json: task, root: false
      else
        render json: { error: 'Internal Server Error'}, status: :internal_server_error
      end
    end

    def destroy
      @task.destroy
      render json: {}, status: :no_content
    end

    private
      def task_params
        params.permit(:name, :priority, :parent_id)
      end

      def correct_user
        @task = @current_user.tasks.find_by(id: params[:id])
        render json: { error: 'Task not found' }, status: :not_found if @task.nil?
      end
  end
end