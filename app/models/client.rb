class Client < ApplicationRecord
  has_many :pets,dependent: :destroy
  accepts_nested_attributes_for :pets, allow_destroy: true, reject_if: proc { |attributes| attributes['name'].blank? }

  def pets_count
    pets.count
  end

  def pets_name 
    pets.pluck(:name)
  end

  def pet_max_weight
    pets.includes(:pet_histories).pluck(:weight).map(&:to_f).max
  end

  def pet_max_height
    pets.includes(:pet_histories).pluck(:heigth).map(&:to_i).max
  end
end
