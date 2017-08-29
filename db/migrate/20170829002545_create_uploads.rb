class CreateUploads < ActiveRecord::Migration[5.1]
  def change
    create_table :uploads do |t|
      t.string :location
      t.string :file_type
      t.string :last_modified

      t.timestamps
    end
  end
end
