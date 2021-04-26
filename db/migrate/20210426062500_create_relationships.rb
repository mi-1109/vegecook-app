class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.integer :follower_id
      t.integer :following_id
      t.timestamp :created_at
      t.timestamp :updated_at

      t.timestamps
    end
  end
end
