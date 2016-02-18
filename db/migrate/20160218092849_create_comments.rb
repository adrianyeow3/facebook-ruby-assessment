class CreateComments < ActiveRecord::Migration
	def change
	    create_table :comments do |t|
	      t.string :my_comment
	      t.integer :user_id
	      t.integer :post_id
	      t.timestamps null: false
	    end
    end
end