class Task < ApplicationRecord
    
    validates :status,
    length: { in: 1..10},
    presence: true
    
    belongs_to :user

end
