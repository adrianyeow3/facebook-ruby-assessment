class CreatePosts < ActiveRecord::Migration
	def change
	    create_table :posts do |t|
	      t.string :my_post
	      t.timestamps null: false
	    end
    end
end