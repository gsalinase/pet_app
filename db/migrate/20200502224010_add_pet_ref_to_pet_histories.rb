class AddPetRefToPetHistories < ActiveRecord::Migration[5.2]
  def change
    add_reference :pet_histories, :pet, foreign_key: true
  end
end
