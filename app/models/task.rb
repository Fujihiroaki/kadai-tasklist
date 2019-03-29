class Task < ApplicationRecord
    
    validates :status,
    length: { in: 1..10},
    presence: true

end
