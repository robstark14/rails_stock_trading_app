IEX::Api.configure do |config|
    config.publishable_token = ENV['IEX_API_PUBLISHABLE_TOKEN']
    # Rails.application.credentials.publishable_token # defaults to ENV['IEX_API_PUBLISHABLE_TOKEN']
    config.secret_token = ENV['IEX_API_SECRET_TOKEN']
    #  Rails.application.credentials.secret_token # defaults to ENV['IEX_API_SECRET_TOKEN']
    config.endpoint = 'https://cloud.iexapis.com/v1' 
end

# Configure IEX::Api.configure do |config|
#     config.publishable_token = 'token' # defaults to 
#     ENV['IEX_API_PUBLISHABLE_TOKEN']
#     config.secret_token = ENV['IEX_API_SECRET_TOKEN']
#     config.endpoint = 'https://cloud.iexapis.com/v1'
#   end 


