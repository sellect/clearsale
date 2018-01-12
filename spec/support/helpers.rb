def order
  {
    "ID"            => "TEST702520225", 
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
end

def expected_request_body_for_send_order
  { 
    "Apikey"           => "your api key", 
    "LoginToken"       => "test token", 
    "AnalysisLocation" =>"USA", 
    "Orders" => [ order ]
  }
end
def expected_request_body_for_get_order_status
  { 
    "Apikey"           => "your api key", 
    "LoginToken"       => "test token", 
    "AnalysisLocation" =>"USA", 
    "Orders" => ['TEST702520224']
  }
end
