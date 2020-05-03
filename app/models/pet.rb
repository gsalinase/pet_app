class Pet < ApplicationRecord
  belongs_to :client
  has_many :pet_histories, dependent: :destroy
  accepts_nested_attributes_for :pet_histories, allow_destroy: true, reject_if: proc { |attributes| attributes['heigth'].blank? }

  def history_count
    #TODO-implement
    pet_histories.count
  end

  def avg_weight
    #TODO-implement
    pet_histories.average(:weight)
  end

  def avg_height
    #TODO-implement
    pet_histories.average(:heigth)
  end

  def max_weight
    #TODO-implement
    pet_histories.pluck(:weight).map(&:to_i).max
  end

  def max_height
    #TODO-implement
    pet_histories.pluck(:heigth).map(&:to_i).max
  end

end
