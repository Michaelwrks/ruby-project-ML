class AddDescriptionToCreatorArtists < ActiveRecord::Migration[7.0]
  def change
    add_column :creator_artists, :description, :string
  end
end
