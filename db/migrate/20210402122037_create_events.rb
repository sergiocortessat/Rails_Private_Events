class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.text :description
      t.date :date
      t.references :creator, null: false, foreign_key:  {to_table: :users}

      t.timestamps
    end
  end
end
