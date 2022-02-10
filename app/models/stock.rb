class Stock < ApplicationRecord

    def self.new_lookup(ticker_symbol)
        client = IEX::Api::Client.new(
            publishable_token: 'Tpk_e95f4c635e6142bf8b16e76efda676af',
            secret_token: 'Tsk_6586337998894155a2f8c2d5d286419a',
            endpoint: 'https://sandbox.iexapis.com/v1'
          )
        client.price(ticker_symbol)
    end

end
