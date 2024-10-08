class SwaggerController < ActionController::Base
    include Swagger::Blocks
  
    swagger_root do
      key :swagger, '2.0'
      info do
        key :version, '1.0.0'
        key :title, 'Earthquake API'
      end
      server do
        key :url, '{scheme}://{host}/{basePath}'
        key :description, 'API server'
        variable :scheme do
          key :default, 'https'
        end
        variable :host do
          key :default, 'your-api-url.com'
        end
        variable :basePath do
          key :default, 'api/v1'
        end
      end
  
      components do
        schema :Earthquake do
          key :required, [:date, :latitude, :longitude, :depth, :location, :magnitude]
          property :id do
            key :type, :integer
          end
          property :date do
            key :type, :string
            key :format, :date-time
          end
          property :latitude do
            key :type, :number
            key :format, :float
          end
          property :longitude do
            key :type, :number
            key :format, :float
          end
          property :depth do
            key :type, :number
            key :format, :float
          end
          property :location do
            key :type, :string
          end
          property :magnitude do
            key :type, :number
            key :format, :float
          end
        end
  
        schema :User do
          key :required, [:email, :password]
          property :id do
            key :type, :integer
          end
          property :email do
            key :type, :string
            key :format, :email
          end
          property :password do
            key :type, :string
          end
        end
  
        schema :Token do
          property :access_token do
            key :type, :string
          end
          property :token_type do
            key :type, :string
            key :default, 'Bearer'
          end
          property :expires_in do
            key :type, :integer
          end
        end
      end
    end
  
    swagger_path '/earthquakes' do
      operation :get do
        key :summary, 'Get all earthquakes (paginated)'
        key :description, 'Retrieves a list of earthquakes. Can paginate results.'
        key :operationId, 'getEarthquakes'
        key :produces, ['application/json']
        parameter do
          key :name, :page
          key :in, :query
          key :description, 'Page number for pagination'
          key :required, false
          key :type, :integer
        end
        response 200 do
          key :description, 'Earthquake response'
          schema do
            key :type, :array
            items do
              key :'$ref', :Earthquake
            end
          end
        end
      end
  
      operation :post do
        key :summary, 'Create a new earthquake'
        key :description, 'Creates a new earthquake record'
        key :operationId, 'createEarthquake'
        key :produces, ['application/json']
        key :consumes, ['application/json']
        parameter do
          key :name, :earthquake
          key :in, :body
          key :description, 'Earthquake object to be created'
          key :required, true
          schema do
            key :'$ref', :Earthquake
          end
        end
        response 201 do
          key :description, 'Earthquake created successfully'
          schema do
            key :'$ref', :Earthquake
          end
        end
      end
    end
  
    swagger_path '/earthquakes/{id}' do
      operation :get do
        key :summary, 'Find an earthquake by ID'
        key :description, 'Returns a single earthquake'
        key :operationId, 'findEarthquakeById'
        key :produces, ['application/json']
        parameter do
          key :name, :id
          key :in, :path
          key :description, 'ID of earthquake to fetch'
          key :required, true
          key :type, :integer
        end
        response 200 do
          key :description, 'Earthquake details'
          schema do
            key :'$ref', :Earthquake
          end
        end
      end
  
      operation :put do
        key :summary, 'Update an earthquake'
        key :description, 'Updates the details of an existing earthquake'
        key :operationId, 'updateEarthquake'
        key :produces, ['application/json']
        key :consumes, ['application/json']
        parameter do
          key :name, :id
          key :in, :path
          key :description, 'ID of earthquake to update'
          key :required, true
          key :type, :integer
        end
        parameter do
          key :name, :earthquake
          key :in, :body
          key :description, 'Updated earthquake object'
          key :required, true
          schema do
            key :'$ref', :Earthquake
          end
        end
        response 200 do
          key :description, 'Earthquake updated successfully'
          schema do
            key :'$ref', :Earthquake
          end
        end
      end
  
      operation :delete do
        key :summary, 'Delete an earthquake'
        key :description, 'Deletes an earthquake by ID'
        key :operationId, 'deleteEarthquake'
        parameter do
          key :name, :id
          key :in, :path
          key :description, 'ID of earthquake to delete'
          key :required, true
          key :type, :integer
        end
        response 204 do
          key :description, 'Earthquake deleted successfully'
        end
      end
    end
end
  