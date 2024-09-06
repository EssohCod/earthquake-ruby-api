module Api
  module V1
    class EarthquakesController < ApplicationController
      before_action :doorkeeper_authorize! # Require user authentication via OAuth
      before_action :set_earthquake, only: [:show, :update, :destroy]

      # GET /earthquakes
      def index
        earthquakes = Rails.cache.fetch("earthquakes_page_#{params[:page]}", expires_in: 12.hours) do
          Earthquake.page(params[:page]).per(20).as_json
        end

        meta = {
          current_page: params[:page] || 1,
          total_pages: Earthquake.page(params[:page]).per(20).total_pages,
          total_count: Earthquake.count
        }

        render json: { earthquakes: earthquakes, meta: meta }
      end

      # GET /earthquakes/:id
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

      # Find the earthquake by ID and handle record not found
      def set_earthquake
        @earthquake = Earthquake.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: { error: 'Earthquake not found' }, status: :not_found
      end

      # Strong parameters
      def earthquake_params
        params.require(:earthquake).permit(:date, :latitude, :longitude, :depth, :location, :magnitude)
      end
    end
  end
end
