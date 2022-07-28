class Task < ApplicationRecord
    belongs_to :category  
    
    delegate :user, to: :category

    validates :name, 
    presence: true,
    uniqueness: true, 
    length: { maximum: 20 }

    validates :description, 
    presence: true,
    length: { within: 5..50 }

    validates :deadline, 
    presence: true
end
