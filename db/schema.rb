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

ActiveRecord::Schema.define(version: 2019_08_06_074829) do

  create_table "arisans", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "nama"
    t.date "mulai"
    t.date "selesai"
    t.string "iuran"
    t.bigint "jenis_kelamin_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["jenis_kelamin_id"], name: "index_arisans_on_jenis_kelamin_id"
  end

  create_table "arisans_users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "arisan_id"
    t.boolean "daftar"
    t.boolean "ikut"
    t.boolean "tarik"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["arisan_id"], name: "index_arisans_users_on_arisan_id"
    t.index ["user_id"], name: "index_arisans_users_on_user_id"
  end

  create_table "bulans", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "nama_bulan"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "iurans", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "bulan_id"
    t.string "tahun"
    t.boolean "sampah"
    t.boolean "sosial"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bulan_id"], name: "index_iurans_on_bulan_id"
    t.index ["user_id"], name: "index_iurans_on_user_id"
  end

  create_table "jenis_kelamins", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "nama"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.decimal "code", precision: 10
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles_users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_roles_users_on_role_id"
    t.index ["user_id"], name: "index_roles_users_on_user_id"
  end

  create_table "tahuns", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "tahun"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_bayar_arisans", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "arisans_user_id"
    t.bigint "bulan_id"
    t.string "tahun"
    t.boolean "bayar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["arisans_user_id"], name: "index_user_bayar_arisans_on_arisans_user_id"
    t.index ["bulan_id"], name: "index_user_bayar_arisans_on_bulan_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "nama"
    t.string "password"
    t.string "no_hp"
    t.bigint "jenis_kelamin_id"
    t.text "alamat"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_kk_id"
    t.string "image_url"
    t.index ["jenis_kelamin_id"], name: "index_users_on_jenis_kelamin_id"
    t.index ["user_kk_id"], name: "index_users_on_user_kk_id"
  end

end
