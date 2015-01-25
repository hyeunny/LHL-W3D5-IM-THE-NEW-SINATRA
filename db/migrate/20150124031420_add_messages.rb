class AddMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :author
      t.text :content
    end
  end
end
