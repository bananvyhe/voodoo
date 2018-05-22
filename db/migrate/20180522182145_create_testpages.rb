class CreateTestpages < ActiveRecord::Migration[5.2]
  def change
    create_table :testpages do |t|
      t.string :title
      t.string :url

      t.timestamps
    end
  end
end
