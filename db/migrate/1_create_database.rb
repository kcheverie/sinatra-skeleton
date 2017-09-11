class CreateDatabase < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :name
      t.string :breed
      t.string :animal
      t.references :owner
    end

    create_table :owners do |t|
      t.string :first_name
      t.string :last_name 
      t.string :phone_number
      t.string :address
    end
  end
end