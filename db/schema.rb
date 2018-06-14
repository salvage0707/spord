# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_06_08_091205) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "areas", force: :cascade do |t|
    t.string "name"
    t.string "name_kana"
    t.integer "region_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "board_purposes", force: :cascade do |t|
    t.integer "board_id"
    t.integer "purpose_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["board_id"], name: "index_board_purposes_on_board_id"
    t.index ["purpose_id"], name: "index_board_purposes_on_purpose_id"
  end

  create_table "board_ranks", force: :cascade do |t|
    t.integer "board_id"
    t.integer "rank_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["board_id"], name: "index_board_ranks_on_board_id"
    t.index ["rank_id"], name: "index_board_ranks_on_rank_id"
  end

  create_table "board_users", force: :cascade do |t|
    t.integer "user_id"
    t.integer "board_id"
    t.boolean "approval"
    t.string "comment"
    t.integer "permission", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["board_id"], name: "index_board_users_on_board_id"
    t.index ["user_id"], name: "index_board_users_on_user_id"
  end

  create_table "boards", force: :cascade do |t|
    t.string "name"
    t.integer "sport_id"
    t.string "do_date"
    t.integer "area_id"
    t.string "city"
    t.date "closing_date"
    t.string "place"
    t.integer "max_people"
    t.string "image_id"
    t.text "introduction"
    t.integer "manager_user_id"
    t.integer "community_id"
    t.integer "delete_flag"
    t.string "qualification"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["area_id"], name: "index_boards_on_area_id"
    t.index ["city"], name: "index_boards_on_city"
    t.index ["community_id"], name: "index_boards_on_community_id"
    t.index ["name"], name: "index_boards_on_name"
    t.index ["sport_id"], name: "index_boards_on_sport_id"
  end

  create_table "communities", force: :cascade do |t|
    t.string "name"
    t.integer "sport_id"
    t.string "active_date"
    t.integer "area_id"
    t.string "city"
    t.integer "max_people"
    t.string "qualification"
    t.string "place"
    t.text "introduction"
    t.string "image_id"
    t.integer "delete_flag"
    t.integer "manager_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["area_id"], name: "index_communities_on_area_id"
    t.index ["city"], name: "index_communities_on_city"
    t.index ["name"], name: "index_communities_on_name"
    t.index ["sport_id"], name: "index_communities_on_sport_id"
  end

  create_table "community_purposes", force: :cascade do |t|
    t.integer "community_id"
    t.integer "purpose_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["community_id"], name: "index_community_purposes_on_community_id"
    t.index ["purpose_id"], name: "index_community_purposes_on_purpose_id"
  end

  create_table "community_ranks", force: :cascade do |t|
    t.integer "community_id"
    t.integer "rank_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["community_id"], name: "index_community_ranks_on_community_id"
    t.index ["rank_id"], name: "index_community_ranks_on_rank_id"
  end

  create_table "community_users", force: :cascade do |t|
    t.integer "user_id"
    t.integer "community_id"
    t.integer "permission", default: 0
    t.string "comment"
    t.boolean "approval", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["community_id"], name: "index_community_users_on_community_id"
    t.index ["user_id"], name: "index_community_users_on_user_id"
  end

  create_table "msg_to_boards", force: :cascade do |t|
    t.integer "board_id"
    t.integer "user_id"
    t.string "message"
    t.boolean "read", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["board_id"], name: "index_msg_to_boards_on_board_id"
    t.index ["read"], name: "index_msg_to_boards_on_read"
  end

  create_table "msg_to_communities", force: :cascade do |t|
    t.integer "community_id"
    t.integer "user_id"
    t.string "message"
    t.boolean "read", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["community_id"], name: "index_msg_to_communities_on_community_id"
    t.index ["read"], name: "index_msg_to_communities_on_read"
  end

  create_table "msg_to_users", force: :cascade do |t|
    t.integer "to_user_id"
    t.integer "user_id"
    t.string "message"
    t.boolean "read", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["read"], name: "index_msg_to_users_on_read"
    t.index ["to_user_id"], name: "index_msg_to_users_on_to_user_id"
  end

  create_table "my_sports", force: :cascade do |t|
    t.integer "storts_id"
    t.integer "user_id"
    t.integer "how_long"
    t.integer "rank_id", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_my_sports_on_user_id"
  end

  create_table "purposes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_purposes_on_name"
  end

  create_table "ranks", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "regions", force: :cascade do |t|
    t.string "name"
    t.string "name_kana"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "follower_id"
    t.integer "followed_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["followed_id"], name: "index_relationships_on_followed_id"
    t.index ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
    t.index ["follower_id"], name: "index_relationships_on_follower_id"
  end

  create_table "sports", force: :cascade do |t|
    t.string "name"
    t.string "big_image_id"
    t.string "small_image_id"
    t.string "introduction"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_sports_on_name"
  end

  create_table "user_purposes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "purpose_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["purpose_id"], name: "index_user_purposes_on_purpose_id"
    t.index ["user_id"], name: "index_user_purposes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "nickname"
    t.string "name"
    t.integer "age"
    t.integer "area_id"
    t.string "city"
    t.boolean "sex"
    t.text "introduction"
    t.string "image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["area_id"], name: "index_users_on_area_id"
    t.index ["city"], name: "index_users_on_city"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["name"], name: "index_users_on_name"
    t.index ["nickname"], name: "index_users_on_nickname"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
