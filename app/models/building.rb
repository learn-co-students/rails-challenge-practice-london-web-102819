class Building < ApplicationRecord
  
  has_many :offices
  has_many :companies, through: :offices


  def empty_offices
    available_floors.map { |f| offices.build(floor: f) }
  end

  def occupied_floors
    self.offices.order(:floor).pluck(:floor)
  end

  def available_floors
    (1..self.number_of_floors).to_a - occupied_floors
  end

  def total_rent
    (self.offices.count*self.rent_per_floor.to_f).to_i
  end

  def self.available_floors
    available_floors = {}
    self.all.each do |b|
      available_floors["#{b.id}"] = {}
      available_floors["#{b.id}"][:floors] =  b.available_floors
      available_floors["#{b.id}"][:name] = b.name
    end
    available_floors
  end

end
