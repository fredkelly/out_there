class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.string :name
      t.text :summary
      t.references :user, index: true

      t.timestamps
    end
  end
end
