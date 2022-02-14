module Api
    module V1
        class TasksController < ApplicationController
            # TODO SHOW CREATE UPDATE DESTROY
            before_action :authenticate_user!
            def show
                query = Task.find(params[:id])
                task = Task.joins("INNER JOIN categories c ON tasks.category_id=c.id INNER JOIN users ON users.id=c.user_id WHERE tasks.id=#{query.id} AND users.id=#{current_user.id}")
                if task.length == 1
                    task = task.first()
                    render json: task, status: 200
                else
                    render json: {message: "Task not found"}, status: 404
                end
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
                query = Task.find(params[:id])
                task = Task.joins("INNER JOIN categories c ON tasks.category_id=c.id INNER JOIN users ON users.id=c.user_id WHERE tasks.id=#{query.id} AND users.id=#{current_user.id}")
                if task.length == 1
                    task = task.first()
                    if task.update(task_params)
                        render json: task, status: 200
                    else
                        render json: task.errors, status: :unprocessable_entity
                    end
                else 
                    render json: {message: "Task not found."}, status: :not_found
                end
            end

            def destroy
                query = Task.find(params[:id])
                task = Task.joins("INNER JOIN categories c ON tasks.category_id=c.id INNER JOIN users ON users.id=c.user_id WHERE tasks.id=#{query.id} AND users.id=#{current_user.id}")
                if task.length == 1
                    t = task.first().destroy!
                    head :no_content
                else
                    render json: {message: "Task not found."}, status: :not_found
                end
            end

            private
            def task_params
                params.require(:task).permit(:name, :description, :date, :completed, :category_id)
            end
        end
    end
end
