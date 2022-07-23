require 'transbank/sdk'
require 'json'

@token = '01ab44dafbe827fcb73832cbf0cb19af03af03f826263506d37445502ffad9c0'

@tx = Transbank::Webpay::WebpayPlus::Transaction.new(::Transbank::Common::IntegrationCommerceCodes::WEBPAY_PLUS)
@resp = @tx.status(@token)

puts @resp.class
puts @resp.inspect



#! Cuando falla la petición, se regresa en POST