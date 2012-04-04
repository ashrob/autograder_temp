class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.text :body
      t.string :status
      t.timestamps
    end
  end
end
