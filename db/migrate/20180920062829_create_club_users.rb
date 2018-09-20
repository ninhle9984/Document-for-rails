class CreateClubUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :club_users do |t|
      t.belongs_to :user, index: true
      t.belongs_to :club, index: true

      t.timestamps
    end
  end
end
