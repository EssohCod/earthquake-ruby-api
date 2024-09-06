# frozen_string_literal: true

module Types
  class EarthquakeType < Types::BaseObject
    field :id, ID, null: false
    field :date, GraphQL::Types::ISO8601DateTime
    field :latitude, Float
    field :longitude, Float
    field :depth, Float
    field :location, String
    field :magnitude, Float
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
