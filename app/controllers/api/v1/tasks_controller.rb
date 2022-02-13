module Api
    module V1
        class TasksController < ApplicationController
            # TODO SHOW CREATE UPDATE DESTROY
            before_action :authenticate_user!
            def show
                task = Task.find(params[:id])

                render json: task, status: 200
            end


            def create
                task = Task.new(task_params)

                if task.save
                    render json: task, status: :created
                else
                    render json: task.errors, status: :unprocessable_entity
                end
            end


            def update
                task = Task.find(params[:id])

                if task.update(task_params)
                    render json: task, status: 200
                else
                    render json: task.errors, status: :unprocessable_entity
                end
            end

            def destroy
                task = Task.find(params[:id]).destroy!

                head :no_content
            end

            private
            def task_params
                params.require(:task).permit(:name, :description, :date, :completed, :category_id)
            end
        end
    end
end
