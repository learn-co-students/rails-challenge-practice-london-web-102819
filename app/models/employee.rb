class Employee < ApplicationRecord
    belongs_to :company

    validates :name, prese
end
