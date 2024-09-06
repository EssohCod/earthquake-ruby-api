# Welcome to My Api
***

This project is hosted here: 
See Postman Documentation here: https://documenter.getpostman.com/view/37174734/2sAXjQ3Ac3

## Task
The goal of this project is to develop an API for managing earthquake data. The API allows users to perform CRUD (Create, Read, Update, Delete) operations on earthquake records, which include details such as date, latitude, longitude, depth, location, and magnitude. The API uses OAuth2 for authentication and provides endpoints to interact with earthquake data.

## Description
The Earthquake API is a Ruby on Rails application that provides a RESTful interface for managing earthquake records. The API includes the following features:

- **OAuth2 Authentication:** Secure access to the API using OAuth2 tokens.

- **CRUD Operations:** Endpoints to create, read, update, and delete earthquake records.

- **Pagination:** The `index` endpoint supports pagination to handle large datasets.

- **Caching:** Earthquake data is cached to improve performance and reduce server load.

- **Swagger Documentation:** Interactive API documentation is provided using Swagger.

The API supports the following endpoints:

- `GET /api/v1/earthquakes` - Retrieve a list of earthquakes (paginated).

- `POST /api/v1/earthquakes` - Create a new earthquake record.

- `GET /api/v1/earthquakes/:id` - Retrieve a single earthquake record by ID.

- `PUT /api/v1/earthquakes/:id` - Update an existing earthquake record.

- `DELETE /api/v1/earthquakes/:id` - Delete an earthquake record by ID.



## Installation

### Prerequisites
- Ruby (version 2.7.0 or higher)
- Rails (version 6.1.0 or higher)
- SQLite3 (or your preferred database adapter)
- Redis (for caching)

### Setup
1. **Clone the repository:**

   ```bash
   git clone https://github.com/your-username/earthquake-api.git
   cd earthquake-api

   Install dependencies: bundle install
   Setup the database: rails db:create and rails db:migrate
   Start the server: rails server

Set up OAuth2 Application:

Navigate to the Doorkeeper::Application model in the Rails console.

Create a new OAuth2 application:
Doorkeeper::Application.create!(
  name: 'MyApp',
  uid: 'your-unique-client-id',
  secret: 'your-client-secret',
  redirect_uri: 'http://localhost:3000/callback',
  scopes: 'public'
)

Configure Redis:

Ensure Redis is running if you’re using it for caching. You can install Redis using your system's package manager or by downloading it from redis.io.




## Usage
Authentication
To access the API, you need to obtain an OAuth2 access token. You can obtain a token by sending a POST request to the token endpoint:
    POST /oauth/token
    Content-Type: application/x-www-form-urlencoded

    grant_type=client_credentials&client_id=your-client-id&client_secret=your-client-secret&scope=public

The response will include an access_token which should be used in the Authorization header for all subsequent API requests:
    Authorization: Bearer your-access-token

Making API Requests
    Get All Earthquakes: 
        GET /api/v1/earthquakes

    Create a New Earthquake:
        POST /api/v1/earthquakes
        Content-Type: application/json
        Authorization: Bearer your-access-token

        {
        "earthquake": {
            "date": "2024-09-06T12:00:00Z",
            "latitude": 34.0522,
            "longitude": -118.2437,
            "depth": 12,
            "location": "Los Angeles",
            "magnitude": 4.6
        }
        }

Get a Single Earthquake:
    GET /api/v1/earthquakes/:id

Update an Earthquake:
    PUT /api/v1/earthquakes/:id
    Content-Type: application/json
    Authorization: Bearer your-access-token

    {
    "earthquake": {
        "date": "2024-09-07T12:00:00Z",
        "latitude": 34.0522,
        "longitude": -118.2437,
        "depth": 10,
        "location": "Los Angeles",
        "magnitude": 4.8
    }
    }

Delete an Earthquake:
    DELETE /api/v1/earthquakes/:id

Swagger Documentation
    Interactive API documentation is available via Swagger. Visit http://localhost:3000/swagger to view and test the API endpoints.

N/B: Replace placeholder values (`your-username`, `your-client-id`, `your-client-secret`, etc.) with actual values relevant to your setup.




### The Core Team: 
Essoh Nsikan Okon - Lead Software Engineer


<span><i>Made at <a href='https://qwasar.io'>Qwasar SV -- Software Engineering School</a></i></span>
<span><img alt='Qwasar SV -- Software Engineering School's Logo' src='https://storage.googleapis.com/qwasar-public/qwasar-logo_50x50.png' width='20px' /></span>
