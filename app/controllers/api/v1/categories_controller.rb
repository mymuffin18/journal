module Api
    module V1
        class CategoriesController < ApplicationController
            def index
                categories = Category.all
                render json: categories.to_json, status: 200
            end

            def show
                category = Category.find(params[:id])

                render json: category.to_json, status: 200
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
                category = Category.find(params[:id])

                if category.update(category_params)
                    render json: category, status: 200
                else
                    render json: category.errors, status: :unprocessable_entity
                end
            end

            def destroy
                Category.find(params[:id]).destroy!

                head :no_content
                
            end

            private
            def category_params
                params.require(:category).permit(:name, :description)
            end
        end
    end
end

