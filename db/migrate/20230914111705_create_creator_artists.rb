class CreateCreatorArtists < ActiveRecord::Migration[7.0]
  def change
    create_table :creator_artists do |t|

      t.string :username
      t.string :email
      t.string :password_digest
      t.string :category


      t.timestamps
    end
  end
end
