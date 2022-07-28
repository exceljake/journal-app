class Category < ApplicationRecord
    has_many :tasks, dependent: :destroy
    belongs_to :user

    validates :name, 
              presence: true,
              uniqueness: true, 
              length: { maximum: 20 }

    validates :details, 
              presence: true,
              length: { within: 5..50 }
end
