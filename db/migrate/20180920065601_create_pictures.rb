class CreatePictures < ActiveRecord::Migration[5.2]
  def change
    create_table :pictures do |t|
      t.string :name
      t.belongs_to :ownerable, polymorphic: true

      t.timestamps
    end
  end
end
