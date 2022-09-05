class Iex < ApplicationRecord
    def self.client
        client = IEX::Api::Client.new(
            publishable_token: 'pk_b3ce259e9e674fef8588c3da61ef3bf8',
            secret_token: 'sk_4e42500f164f447e8f15c96b60ffe467',
            endpoint: 'https://cloud.iexapis.com/v1'
        )
    end
end