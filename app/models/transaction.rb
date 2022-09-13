class Transaction < ApplicationRecord
    belongs_to :user
    
    include IexAccessor
end
