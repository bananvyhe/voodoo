class CreateNews < ActiveRecord::Migration[6.1]
  def change
    create_table :news do |t|
      t.string :imglink
      t.string :head
      t.string :content
      t.string :link
      t.string :datepost

      t.timestamps
    end
  end
end
