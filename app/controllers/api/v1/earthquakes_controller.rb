module Api
  module V1
    class EarthquakesController < ApplicationController
      before_action :doorkeeper_authorize! # Fixed this line
      before_action :set_earthquake, only: [:show, :update, :destroy]

      # GET /earthquakes
      def index
        earthquakes = Earthquake.page(params[:page]).per(20).as_json
        Rails.cache.write("earthquakes_page_#{params[:page]}", earthquakes, expires_in: 12.hours)
        render json: earthquakes
      end
      
      def show
        render json: @earthquake
      end

      # POST /earthquakes
      def create
        @earthquake = Earthquake.new(earthquake_params)
        if @earthquake.save
          render json: @earthquake, status: :created
        else
          render json: @earthquake.errors, status: :unprocessable_entity
        end
      end

      # PUT /earthquakes/:id
      def update
        if @earthquake.update(earthquake_params)
          render json: @earthquake
        else
          render json: @earthquake.errors, status: :unprocessable_entity
        end
      end

      # DELETE /earthquakes/:id
      def destroy
        @earthquake.destroy
        head :no_content
      end

      private

      def set_earthquake
        @earthquake = Earthquake.find(params[:id])
      end

      def earthquake_params
        params.require(:earthquake).permit(:date, :latitude, :longitude, :depth, :location, :magnitude)
      end
    end
  end
end
