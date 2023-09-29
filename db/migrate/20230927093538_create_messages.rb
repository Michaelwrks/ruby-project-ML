class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.references :sender, polymorphic: true, index: true
      t.references :receiver, polymorphic: true, index: true
      t.text :content
      t.boolean :read, default: false

      t.timestamps
    end
  end
end
