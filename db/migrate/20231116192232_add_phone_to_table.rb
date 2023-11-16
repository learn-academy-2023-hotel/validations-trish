class AddPhoneToTable < ActiveRecord::Migration[7.0]
  def change
    add_column :animals, :phone, :string
  end
end
