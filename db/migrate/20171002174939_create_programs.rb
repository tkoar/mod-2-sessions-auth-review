class CreatePrograms < ActiveRecord::Migration[5.1]
  def change
    create_table :programs do |t|
      t.references :user
      t.string :name
      t.string :language

      t.timestamps
    end
  end
end
