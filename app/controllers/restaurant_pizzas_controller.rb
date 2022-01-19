class RestaurantPizzasController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    def create 
        restaurant_pizza = RestaurantPizza.create!(restaurant_pizza_params)
        render json: restaurant_pizza.pizza,
        status: :created
    end

    private 

    def restaurant_pizza_params
        params.permit(:pizza_id, :restaurant_id, :price)
    end

    def render_unprocessable_entity_response
        render json: {errors: ["Validation errors"]}, status: :unprocessable_entity 
end
end