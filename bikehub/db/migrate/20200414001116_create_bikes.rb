class CreateBikes < ActiveRecord::Migration[6.0]
  def change
    create_table :bikes do |t|
      t.string :manufacturer_name
      t.string :frame_model
      t.string :image_url

      t.timestamps
    end
  end
end
