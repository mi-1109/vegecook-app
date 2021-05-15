class InitSchema < ActiveRecord::Migration[5.2]
  def up
    create_table "admins" do |t|
      t.string "email", default: "", null: false
      t.string "encrypted_password", default: "", null: false
      t.string "reset_password_token"
      t.datetime "reset_password_sent_at"
      t.datetime "remember_created_at"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["email"], name: "index_admins_on_email", unique: true
      t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
    end
    create_table "chat_rooms" do |t|
      t.integer "user_id", null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
    create_table "chats" do |t|
      t.integer "chat_room_id", null: false
      t.integer "user_id"
      t.text "message", null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.integer "admin_id"
    end
    create_table "comments" do |t|
      t.integer "post_recipe_id", null: false
      t.integer "user_id", null: false
      t.text "comment", null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
    create_table "form_inquiries" do |t|
      t.integer "user_id", null: false
      t.text "content", null: false
      t.integer "response_status", default: 0, null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
    create_table "histories" do |t|
      t.integer "post_recipe_id", null: false
      t.integer "user_id", null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
    create_table "ingredients" do |t|
      t.integer "post_recipe_id", null: false
      t.string "name"
      t.string "amount"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
    create_table "likes" do |t|
      t.integer "post_recipe_id", null: false
      t.integer "user_id", null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
    create_table "post_recipes" do |t|
      t.integer "user_id", null: false
      t.string "title"
      t.text "introduction"
      t.string "recipe_image_id"
      t.boolean "is_draft", default: false, null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.string "serving"
      t.integer "veg_type"
    end
    create_table "procedures" do |t|
      t.integer "post_recipe_id", null: false
      t.text "body"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
    create_table "relationships" do |t|
      t.integer "follower_id", null: false
      t.integer "following_id", null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
    create_table "saved_recipes" do |t|
      t.integer "post_recipe_id", null: false
      t.integer "user_id", null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
    create_table "users" do |t|
      t.string "email", default: "", null: false
      t.string "encrypted_password", default: "", null: false
      t.string "reset_password_token"
      t.datetime "reset_password_sent_at"
      t.datetime "remember_created_at"
      t.string "name", null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.string "profile_image_id"
      t.boolean "is_paid", default: false, null: false
      t.boolean "is_deleted", default: false, null: false
      t.text "introduction"
      t.index ["email"], name: "index_users_on_email", unique: true
      t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    end
  end

  def down
    raise ActiveRecord::IrreversibleMigration, "The initial migration is not revertable"
  end
end
