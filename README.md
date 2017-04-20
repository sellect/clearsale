= Clearsale

## Setup
  Add the gem to your `Gemfile`.
  ```ruby 
  gem 'clearsale', git: 'git@github.com:sellect/clearsale
  ```

  Execute
  ```ruby
    bundle install
  ```
  Setup your Clearsale credentials, either in a yml file, or as enviroment variables. If you want to add a yml file, it'll just need ```api_key```, ```client_id```, ```client_secret``` and ```analysis_location```

  ```ruby
  api_key: 'your api key'
  client_id: 'client id'
  client_secret: 'secret'
  analysis_location: 'USA'

  ```
  Also need to specify a different endpoints for development / production mode
  ```ruby
  endpoint: 'https://sandbox.clearsale.com.br/api'
  ```
  OR
  ```ruby
  endpoint: 'https://integration.clearsale.com.br/api/'
  ```

  Setup the gem in an initializer (if using Rails). Following is example to load in config:
  ```ruby
  file = File.new(File.join(Rails.root, 'config', 'clearsale.yml'))

  if file.exist?
    begin
      CLEARSALE_CONFIGURATION = YAML.load_file(path)

      Clearsale.configure do |config|
        config.api_key           = CLEARSALE_CONFIGURATION['api_key']           || abort("Clearsale congiguration file '#{path}' is missing the api key")
        config.client_id         = CLEARSALE_CONFIGURATION['client_id']         || abort("Clearsale congiguration file '#{path}' is missing the client id")
        config.client_secret     = CLEARSALE_CONFIGURATION['client_secret']     || abort("Clearsale congiguration file '#{path}' is missing the client_secret")
        config.analysis_location = CLEARSALE_CONFIGURATION['analysis_location'] || abort("Clearsale congiguration file '#{path}' is missing the analysis_location")
        config.endpoint          =  Rails.env.production? ? 'https://integration.clearsale.com.br/api/' : 'https://sandbox.clearsale.com.br/api'
      end
    rescue NoMethodError
      abort "Clearsale congiguration file '#{path}' is malformatted or unreadable"
    end
  else
    abort "Clearsale congiguration file '#{path}' not found"
  end
  ``` 

## Usage
  After setup you should be able to use a few endpoints to Clearsale fraud service. if you need a new endpoint, feel free to fork this gem, add support for it, add specs and do a pull request.

  ### Get Authentication token request
    ```ruby
      response = Clearsale::Authentication.request_auth
      # Access the details of the response
      response.Status
    ```

  ### Sample Order hash to be sent to gem. You can update
    ```ruby
      {
        "ID"            => "TEST702520515", 
        "Date"          => "2017-03-01T13:48:08-0800", 
        "Email"         => "sagar@sellect.com", 
        "TotalItems"    => 1995.0, 
        "TotalOrder"    => 19.95, 
        "TotalShipping" => 0.0,
        "IP"            => "69.193.133.38", 
        "Currency"      => "usd", 
        "Payments"      => [{
          "Date"               =>"2017-03-01T13:48:08-0800", 
          "Type"               =>1, 
          "CardType"           =>3, 
          "CardEndNumber"      => "4242", 
          "CardHolderName"     => "Sagar Rathi", 
          "CardExpirationDate" => "09/20", 
          "Amount"             => 19.95
        }], 
        "BillingData"=> {
          "ID"      => 372, 
          "Type"    =>1, 
          "Name"    => "Sagar Rathi", 
          "Address" => {
            "AddressLine1" => "3206 29th street #4B", 
            "AddressLine2" => "4B", 
            "City"         => "Astoria", 
            "State"        => "NY", 
            "Country"      => "UNITED STATES", 
            "ZipCode"      => "11106" 
          }, 
          "Phones" =>[{
            "Type"     => 6, 
            "AreaCode" => "474", 
            "Number"   =>"140296"
          }]
        }, 
        "ShippingData"=> {
          "ID"      => 371, 
          "Type"    => 1, 
          "Name"    => "Sagar Rathi", 
          "Address" => {
            "AddressLine1" => "3206 29th street #4B", 
            "AddressLine2" => "4B", 
            "City"         => "Astoria", 
            "State"        => "NY", 
            "Country"      => "UNITED STATES", 
            "ZipCode"      => "11106" 
          }, 
          "Phones" => [{
            "Type"     => 6, 
            "AreaCode" => "474", 
            "Number"   => "140296" 
          }]
        }, 
        "Items" => [{
          "ProductId"    => 7, 
          "ProductTitle" => "Navy Hopsack Blazer", 
          "Price"        =>1995.0, 
          "Quantity" =>1 
        }], 
        "SessionId"=>"Apr 18th 2017 Tue 06:52 PM UTC"
      }

  ```
  
  ### Send Order 
  ```ruby
    response = Clearsale::Analysis.send_order(order)

    # Access the details of the response
    response.order_id
    response.score
    response.status
  ```


  ### Get order status 
  order_id = '1234'
  response = Clearsale::Analysis.get_order_status(order_id)

  # Access the details of the response
  response.order_id
  # => 1234

  response.score
  # => (0.0..99.99)

  response.status
  # => :automatic_approval
  # => :manual_approval
  # => :rejected_without_suspicion
  # => :manual_analysis
  # => :error
  # => :waiting
  # => :manual_rejection
  # => :cancelled
  # => :fraud

