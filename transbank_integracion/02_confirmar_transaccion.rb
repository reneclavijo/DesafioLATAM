#? LA CONFIRMACIÓN LLEGA POR UN GET

require 'transbank/sdk'
require 'json'

# Hay que agregarlo al método GET de return_url

token_ws = '01ab44dafbe827fcb73832cbf0cb19af03af03f826263506d37445502ffad9c0'

begin

@tx = Transbank::Webpay::WebpayPlus::Transaction.new(::Transbank::Common::IntegrationCommerceCodes::WEBPAY_PLUS)
@resp = @tx.commit(token_ws)

puts @resp.class
puts @resp.inspect

rescue => e
    puts e
    puts @tx.inspect
    puts @resp.inspect
end

# puts @resp.vci
# puts @resp.amount
# puts @resp.status
# puts @resp.buy_order
# puts @resp.session_id
# puts @resp.card_detail
# puts @resp.accounting_date
# puts @resp.transaction_date
# puts @resp.authorization_code
# puts @resp.payment_type_code
# puts @resp.response_code
# puts @resp.installments_amount
# puts @resp.installments_number
# puts @resp.balance
