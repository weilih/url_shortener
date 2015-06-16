class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :original, null:false, default:""
      t.string :shorten,  null:false, default:""
      t.timestamps null: false
    end

    add_index :urls, :shorten, unique: true
  end
end
