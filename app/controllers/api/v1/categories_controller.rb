module Api
    module V1
        class CategoriesController < ApplicationController
            before_action :authenticate_user!

            def index
                
                categories = current_user.categories
                render json: categories.to_json, status: 200
            end

            def show
                category = Category.find(params[:id])
                c = current_user.categories.where(id: category.id)
                if c.length == 1
                    c = c.first()
                    render json: c.to_json, status: 200
                else
                    render json: { message: 'Category not found.'}, status: :not_found
                end
            end

            

            def create
                category = Category.new(category_params)

                if category.save
                    render json: category, status: :created
                else
                    render json: category.errors, status: :unprocessable_entity
                end
            end
            
            def update
                query = Category.find(params[:id])
                category = current_user.categories.where(id: query.id)
                if category.length == 1
                    category = category.first()
                    if category.update(category_params)
                        render json: category, status: 200
                    else
                        render json: category.errors, status: :unprocessable_entity
                    end
                else
                    render json: { message: "Category not found"}, status: :not_found
                end
            end

            def destroy
                query = Category.find(params[:id])
                category = current_user.categories.where(id: query.id)
                if category.length == 1
                    c = category.first().destroy!
                    head :no_content
                else 
                    render json: {message: "Category not found"}, status: :not_found
                end
                
            end

            private
            def category_params
                params.require(:category).permit(:name, :description, :user_id)
            end
        end
    end
end

