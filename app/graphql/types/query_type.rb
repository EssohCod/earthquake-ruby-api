# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :earthquakes, [Types::EarthquakeType], null: false do
      argument :page, Int, required: false
    end
    
    def earthquakes(page: nil)
      Earthquake.page(page).per(20)
    end
  end
end
