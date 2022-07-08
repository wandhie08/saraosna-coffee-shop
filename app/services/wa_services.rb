class WaServices
  include HTTParty
  base_uri 'http://kopi.zenziva.co.id/api/'
  headers 'Content-Type' => 'application/json'
end