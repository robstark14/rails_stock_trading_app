IEX::Api.configure do |config|
    config.publishable_token = 'pk_b3ce259e9e674fef8588c3da61ef3bf8' 
    # Rails.application.credentials.publishable_token # defaults to ENV['IEX_API_PUBLISHABLE_TOKEN']
    config.secret_token = 'sk_0316d9022ff64b7fa63b2f194df3559e'
    #  Rails.application.credentials.secret_token # defaults to ENV['IEX_API_SECRET_TOKEN']
    config.endpoint = 'https://cloud.iexapis.com/v1' 
end

# Configure IEX::Api.configure do |config|
#     config.publishable_token = 'token' # defaults to 
#     ENV['IEX_API_PUBLISHABLE_TOKEN']
#     config.secret_token = ENV['IEX_API_SECRET_TOKEN']
#     config.endpoint = 'https://cloud.iexapis.com/v1'
#   end 


