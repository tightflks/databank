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

ActiveRecord::Schema.define(version: 20170209232156) do

  create_table "auth_group", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name", limit: 80, null: false
    t.index ["name"], name: "name", unique: true, using: :btree
  end

  create_table "auth_group_permissions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "group_id",      null: false
    t.integer "permission_id", null: false
    t.index ["group_id", "permission_id"], name: "group_id", unique: true, using: :btree
    t.index ["group_id"], name: "auth_group_permissions_5f412f9a", using: :btree
    t.index ["permission_id"], name: "auth_group_permissions_83d7f98b", using: :btree
  end

  create_table "auth_permission", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string  "name",            limit: 50,  null: false
    t.integer "content_type_id",             null: false
    t.string  "codename",        limit: 100, null: false
    t.index ["content_type_id", "codename"], name: "content_type_id", unique: true, using: :btree
    t.index ["content_type_id"], name: "auth_permission_37ef4eb4", using: :btree
  end

  create_table "auth_user", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "password",     limit: 128, null: false
    t.datetime "last_login",               null: false
    t.boolean  "is_superuser",             null: false
    t.string   "username",     limit: 30,  null: false
    t.string   "first_name",   limit: 30,  null: false
    t.string   "last_name",    limit: 30,  null: false
    t.string   "email",        limit: 75,  null: false
    t.boolean  "is_staff",                 null: false
    t.boolean  "is_active",                null: false
    t.datetime "date_joined",              null: false
    t.index ["username"], name: "username", unique: true, using: :btree
  end

  create_table "auth_user_groups", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "user_id",  null: false
    t.integer "group_id", null: false
    t.index ["group_id"], name: "auth_user_groups_5f412f9a", using: :btree
    t.index ["user_id", "group_id"], name: "user_id", unique: true, using: :btree
    t.index ["user_id"], name: "auth_user_groups_6340c63c", using: :btree
  end

  create_table "auth_user_user_permissions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "user_id",       null: false
    t.integer "permission_id", null: false
    t.index ["permission_id"], name: "auth_user_user_permissions_83d7f98b", using: :btree
    t.index ["user_id", "permission_id"], name: "user_id", unique: true, using: :btree
    t.index ["user_id"], name: "auth_user_user_permissions_6340c63c", using: :btree
  end

  create_table "django_admin_log", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.datetime "action_time",                        null: false
    t.integer  "user_id",                            null: false
    t.integer  "content_type_id"
    t.text     "object_id",       limit: 4294967295
    t.string   "object_repr",     limit: 200,        null: false
    t.integer  "action_flag",     limit: 2,          null: false, unsigned: true
    t.text     "change_message",  limit: 4294967295, null: false
    t.index ["content_type_id"], name: "django_admin_log_37ef4eb4", using: :btree
    t.index ["user_id"], name: "django_admin_log_6340c63c", using: :btree
  end

  create_table "django_content_type", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name",      limit: 100, null: false
    t.string "app_label", limit: 100, null: false
    t.string "model",     limit: 100, null: false
    t.index ["app_label", "model"], name: "app_label", unique: true, using: :btree
  end

  create_table "django_session", primary_key: "session_key", id: :string, limit: 40, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.text     "session_data", limit: 4294967295, null: false
    t.datetime "expire_date",                     null: false
    t.index ["expire_date"], name: "django_session_b7b81f0c", using: :btree
  end

  create_table "django_site", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "domain", limit: 100, null: false
    t.string "name",   limit: 50,  null: false
  end

  create_table "insider_databankapartments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string  "P_NAME",                  limit: 200,                                       null: false
    t.string  "P_TYPE",                  limit: 2,                                         null: false
    t.string  "MARKET_AREA",             limit: 4,                                         null: false
    t.integer "P_STREET_NUMBER"
    t.string  "P_STREET_NAME",           limit: 200,                                       null: false
    t.string  "P_CROSS_STREET_NAME",     limit: 200,                                       null: false
    t.string  "P_CITY",                  limit: 70,                                        null: false
    t.integer "P_ZIP"
    t.string  "COUNTY",                  limit: 60,                                        null: false
    t.string  "DISTRICT2",               limit: 100,                                       null: false
    t.integer "SQUARE"
    t.integer "PARCEL"
    t.string  "ZONING",                  limit: 200,                                       null: false
    t.string  "ZONING_PERMITTING_DATE",  limit: 200,                                       null: false
    t.integer "UNITS_COMPLETED"
    t.decimal "#_ACRES",                             precision: 6,  scale: 2
    t.decimal "SF_LAND",                             precision: 15, scale: 2
    t.date    "LAND_SALE_DATE",                                                            null: false
    t.integer "LAND_SALE_PRICE",                                                           null: false
    t.string  "_ACRE",                   limit: 9,                                         null: false
    t.string  "_SF",                     limit: 3,                                         null: false
    t.string  "_UNIT_LAND",              limit: 8,                                         null: false
    t.date    "sale_date",                                                                 null: false
    t.integer "SALE_PRICE"
    t.string  "_UNIT_PROJECT",           limit: 10,                                        null: false
    t.string  "TAX_OWNER",               limit: 54,                                        null: false
    t.string  "O_STREET_NAME",           limit: 80,                                        null: false
    t.string  "O_CITY",                  limit: 8,                                         null: false
    t.string  "O_PHONE",                 limit: 14,                                        null: false
    t.string  "O_REP",                   limit: 19,                                        null: false
    t.string  "BROKER",                  limit: 42,                                        null: false
    t.string  "B_PHONE",                 limit: 14,                                        null: false
    t.string  "B_STREET_NAME",           limit: 150,                                       null: false
    t.string  "B_CITY",                  limit: 7,                                         null: false
    t.string  "B_REP",                   limit: 15,                                        null: false
    t.string  "B_REP2",                  limit: 24,                                        null: false
    t.integer "PLANNER"
    t.string  "HEATED_SF",               limit: 7,                                         null: false
    t.string  "MONTHLY_INCOME",          limit: 10,                                        null: false
    t.string  "YEARLY_INCOME",           limit: 3,                                         null: false
    t.string  "0_BED",                   limit: 10,                                        null: false
    t.integer "1_BED"
    t.integer "2_BED"
    t.string  "3_BED",                   limit: 10,                                        null: false
    t.string  "4_BED",                   limit: 10,                                        null: false
    t.string  "SELLER_FORECLOSEE",       limit: 45,                                        null: false
    t.string  "S_STREET_NAME",           limit: 11,                                        null: false
    t.string  "S_CITY",                  limit: 7,                                         null: false
    t.string  "S_PHONE",                 limit: 36,                                        null: false
    t.string  "ATTORNEY",                limit: 10,                                        null: false
    t.string  "ATTORNEY_PHONE",          limit: 14,                                        null: false
    t.string  "_LOAN",                   limit: 12,                                        null: false
    t.string  "LENDER",                  limit: 30,                                        null: false
    t.string  "L_STREET_NAME",           limit: 8,                                         null: false
    t.string  "L_CITY",                  limit: 8,                                         null: false
    t.string  "L_PHONE",                 limit: 14,                                        null: false
    t.string  "L_REP",                   limit: 42,                                        null: false
    t.string  "_C_LOAN",                 limit: 10,                                        null: false
    t.string  "C_LENDER",                limit: 26,                                        null: false
    t.string  "C_L_STREET_NAME",         limit: 18,                                        null: false
    t.string  "C_L_CITY",                limit: 6,                                         null: false
    t.string  "C_L_PHONE",               limit: 14,                                        null: false
    t.string  "C_L_REP",                 limit: 14,                                        null: false
    t.string  "ONSITE_PHONE",            limit: 14,                                        null: false
    t.string  "ONSITE_MANAGER",          limit: 21,                                        null: false
    t.string  "UTILITIES",               limit: 1,                                         null: false
    t.string  "APPLICATION_FEE",         limit: 10,                                        null: false
    t.string  "DEPOSIT",                 limit: 10,                                        null: false
    t.string  "REFUND",                  limit: 10,                                        null: false
    t.string  "LEASE",                   limit: 10,                                        null: false
    t.string  "_EQUITY",                 limit: 12,                                        null: false
    t.integer "__EQUITY"
    t.string  "_DOWNPAYMENT",            limit: 12,                                        null: false
    t.integer "__DOWNPAYMENT"
    t.string  "_UNDERLYING",             limit: 10,                                        null: false
    t.string  "_PURCHASE_NOTE",          limit: 10,                                        null: false
    t.string  "0_MIN_SF",                limit: 10,                                        null: false
    t.integer "1_MIN_SF"
    t.string  "2_MIN_SF",                limit: 5,                                         null: false
    t.string  "3_MIN_SF",                limit: 10,                                        null: false
    t.string  "4_MIN_SF",                limit: 10,                                        null: false
    t.string  "0_MAX_SF",                limit: 10,                                        null: false
    t.integer "1_MAX_SF"
    t.string  "2_MAX_SF",                limit: 5,                                         null: false
    t.string  "3_MAX_SF",                limit: 10,                                        null: false
    t.string  "4_MAX_SF",                limit: 10,                                        null: false
    t.string  "0_MIN_",                  limit: 10,                                        null: false
    t.string  "1_MIN_",                  limit: 5,                                         null: false
    t.string  "2_MIN_",                  limit: 5,                                         null: false
    t.string  "3_MIN_",                  limit: 10,                                        null: false
    t.string  "4_MIN_",                  limit: 10,                                        null: false
    t.string  "0_MAX_",                  limit: 10,                                        null: false
    t.string  "1_MAX_",                  limit: 5,                                         null: false
    t.string  "2_MAX_",                  limit: 7,                                         null: false
    t.string  "3_MAX_",                  limit: 10,                                        null: false
    t.string  "4_MAX_",                  limit: 10,                                        null: false
    t.string  "0_NOTE_1",                limit: 10,                                        null: false
    t.string  "1_NOTE_1",                limit: 73,                                        null: false
    t.string  "2_NOTE_1",                limit: 78,                                        null: false
    t.string  "3_NOTE_1",                limit: 10,                                        null: false
    t.string  "4_NOTE_1",                limit: 10,                                        null: false
    t.string  "M1",                      limit: 68,                                        null: false
    t.string  "M2",                      limit: 70,                                        null: false
    t.string  "M3",                      limit: 70,                                        null: false
    t.string  "M4",                      limit: 70,                                        null: false
    t.string  "M5",                      limit: 65,                                        null: false
    t.string  "M6",                      limit: 66,                                        null: false
    t.string  "M7",                      limit: 66,                                        null: false
    t.string  "M8",                      limit: 68,                                        null: false
    t.string  "M9",                      limit: 44,                                        null: false
    t.string  "M10",                     limit: 10,                                        null: false
    t.string  "0_MIN__1",                limit: 10,                                        null: false
    t.string  "0_MAX__1",                limit: 10,                                        null: false
    t.string  "1_MIN__1",                limit: 5,                                         null: false
    t.string  "1_MAX__1",                limit: 5,                                         null: false
    t.string  "2_MIN__1",                limit: 5,                                         null: false
    t.string  "2_MAX__1",                limit: 5,                                         null: false
    t.string  "3_MIN__1",                limit: 10,                                        null: false
    t.string  "3_MAX__1",                limit: 10,                                        null: false
    t.string  "4_MIN__1",                limit: 10,                                        null: false
    t.string  "4_MAX__1",                limit: 10,                                        null: false
    t.string  "0_MIN__2",                limit: 10,                                        null: false
    t.string  "0_MAX__2",                limit: 10,                                        null: false
    t.string  "1_MIN__2",                limit: 5,                                         null: false
    t.string  "1_MAX__2",                limit: 5,                                         null: false
    t.string  "2_MIN__2",                limit: 5,                                         null: false
    t.string  "2_MAX__2",                limit: 5,                                         null: false
    t.string  "3_MIN__2",                limit: 10,                                        null: false
    t.string  "3_MAX__2",                limit: 10,                                        null: false
    t.string  "4_MIN__2",                limit: 10,                                        null: false
    t.string  "4_MAX__2",                limit: 10,                                        null: false
    t.string  "0_MIN__3",                limit: 10,                                        null: false
    t.string  "0_MAX__3",                limit: 10,                                        null: false
    t.string  "1_MIN__3",                limit: 5,                                         null: false
    t.string  "1_MAX__3",                limit: 5,                                         null: false
    t.string  "2_MIN__3",                limit: 5,                                         null: false
    t.string  "2_MAX__3",                limit: 5,                                         null: false
    t.string  "3_MIN__3",                limit: 10,                                        null: false
    t.string  "3_MAX__3",                limit: 10,                                        null: false
    t.string  "4_MIN__3",                limit: 10,                                        null: false
    t.string  "4_MAX__3",                limit: 10,                                        null: false
    t.string  "0_MIN__4",                limit: 10,                                        null: false
    t.string  "0_MAX__4",                limit: 10,                                        null: false
    t.string  "1_MIN__4",                limit: 5,                                         null: false
    t.string  "1_MAX__4",                limit: 5,                                         null: false
    t.string  "2_MIN__4",                limit: 5,                                         null: false
    t.string  "2_MAX__4",                limit: 5,                                         null: false
    t.string  "3_MIN__4",                limit: 10,                                        null: false
    t.string  "3_MAX__4",                limit: 10,                                        null: false
    t.string  "4_MIN__4",                limit: 10,                                        null: false
    t.string  "4_MAX__4",                limit: 10,                                        null: false
    t.string  "0_INCREASE",              limit: 10,                                        null: false
    t.decimal "1_INCREASE",                          precision: 12, scale: 8
    t.decimal "2_INCREASE",                          precision: 12, scale: 8
    t.string  "3_INCREASE",              limit: 10,                                        null: false
    t.string  "4_INCREASE",              limit: 10,                                        null: false
    t.string  "OCCUPANCY",               limit: 10,                                        null: false
    t.string  "GOVERNMENT_PROGRAM",      limit: 10,                                        null: false
    t.string  "INSIDER_DESCRIPTION",     limit: 200,                          default: "", null: false
    t.string  "AKA",                     limit: 35,                                        null: false
    t.string  "SURVEY",                  limit: 6,                                         null: false
    t.integer "PERMITTED"
    t.string  "PREVIOUS_INSIDER_DATE_1", limit: 7,                                         null: false
    t.date    "insider_date",                                                              null: false
    t.string  "P_STATE",                 limit: 2,                                         null: false
    t.string  "PREVIOUS_INSIDER_DATE_2", limit: 9,                                         null: false
    t.string  "PREVIOUS_INSIDER_DATE_3", limit: 8,                                         null: false
    t.string  "O_REP2",                  limit: 85,                                        null: false
    t.integer "O_STREET_NUMBER"
    t.string  "O_SUITE_NUMBER",          limit: 7,                                         null: false
    t.string  "O_STATE",                 limit: 2,                                         null: false
    t.integer "O_ZIP"
    t.integer "B_STREET_NUMBER"
    t.string  "B_P_O_BOX_NUMBER",        limit: 10,                                        null: false
    t.string  "B_SUITE_NUMBER",          limit: 4,                                         null: false
    t.string  "B_STATE",                 limit: 2,                                         null: false
    t.integer "B_ZIP"
    t.string  "S_REP",                   limit: 82,                                        null: false
    t.integer "S_STREET_NUMBER"
    t.string  "S_P_O_BOX_NUMBER",        limit: 10,                                        null: false
    t.string  "S_SUITE_NUMBER",          limit: 5,                                         null: false
    t.string  "S_STATE",                 limit: 2,                                         null: false
    t.integer "S_ZIP"
    t.integer "L_STREET_NUMBER"
    t.string  "L_SUITE_NUMBER",          limit: 10,                                        null: false
    t.string  "L_STATE",                 limit: 2,                                         null: false
    t.integer "L_ZIP"
    t.integer "C_L_STREET_NUMBER"
    t.string  "C_L_P_O_BOX_NUMBER",      limit: 10,                                        null: false
    t.string  "C_L_STATE",               limit: 2,                                         null: false
    t.integer "C_L_ZIP"
    t.string  "C_L_SUITE_NUMBER",        limit: 10,                                        null: false
    t.string  "UNBUILT_PHASE_2_UNITS",   limit: 10,                                        null: false
    t.string  "PHASE_3_UNITS",           limit: 10,                                        null: false
    t.string  "PHASE_4_UNITS",           limit: 10,                                        null: false
    t.string  "START_DATE",              limit: 10,                                        null: false
    t.string  "CONCESSIONS",             limit: 10,                                        null: false
    t.string  "6TH_HALF_YEAR",           limit: 10,                                        null: false
    t.string  "THIS_HALF_YEAR",          limit: 10,                                        null: false
    t.string  "2ND_HALF_YEAR",           limit: 10,                                        null: false
    t.string  "3RD_HALF_YEAR",           limit: 10,                                        null: false
    t.string  "3_YRS_FROM_NOW_&_BEYOND", limit: 10,                                        null: false
    t.integer "DISTRICT"
    t.integer "LANDLOT"
    t.string  "LANDLOT2",                limit: 10,                                        null: false
    t.string  "0_avg_",                  limit: 10,                                        null: false
    t.integer "1_avg_"
    t.decimal "2_avg_",                              precision: 6,  scale: 1
    t.string  "3_avg_",                  limit: 10,                                        null: false
    t.string  "4_avg_",                  limit: 10,                                        null: false
    t.string  "DESCRIPTION",             limit: 200,                          default: "", null: false
    t.decimal "2_avg__per_sf",                       precision: 12, scale: 9
    t.string  "SECTION",                 limit: 10,                                        null: false
    t.string  "O_P_O_BOX_NUMBER",        limit: 10,                                        null: false
    t.string  "O_PHONE2_FAX",            limit: 50,                                        null: false
    t.string  "PARCEL2",                 limit: 10,                                        null: false
    t.string  "LEASING_PHONE",           limit: 14,                                        null: false
    t.string  "SQUARE2",                 limit: 10,                                        null: false
    t.string  "LEASING_REP",             limit: 17,                                        null: false
    t.string  "LEASING_REP2",            limit: 45,                                        null: false
    t.integer "LEASING_STREET_NUMBER"
    t.string  "LEASING_STREET_NAME",     limit: 9,                                         null: false
    t.string  "LEASING_P_O_BOX_NUMBER",  limit: 10,                                        null: false
    t.string  "LEASING_SUITE_NUMBER",    limit: 7,                                         null: false
    t.string  "LEASING_CITY",            limit: 7,                                         null: false
    t.string  "LEASING_STATE",           limit: 2,                                         null: false
    t.integer "LEASING_ZIP"
    t.string  "L_P_O_BOX_NUMBER",        limit: 10,                                        null: false
    t.string  "OWNER2_ATTENTION",        limit: 21,                                        null: false
    t.string  "LOAN_START_DATE",         limit: 8,                                         null: false
    t.string  "LOAN_DUE_DATE",           limit: 10,                                        null: false
    t.string  "C_LOAN_START_DATE",       limit: 10,                                        null: false
    t.string  "C_LOAN_DUE_DATE",         limit: 10,                                        null: false
    t.string  "OWNER_OCCUPANCY",         limit: 10,                                        null: false
    t.string  "PET_DEPOSIT",             limit: 10,                                        null: false
    t.string  "4TH_HALF_YEAR",           limit: 10,                                        null: false
    t.string  "5TH_HALF_YEAR",           limit: 10,                                        null: false
    t.string  "OWNER",                   limit: 44,                                        null: false
    t.string  "LEASING_COMPANY",         limit: 11,                                        null: false
    t.decimal "UNITS_PER_ACRE",                      precision: 12, scale: 8
    t.string  "UNITS_VACANT",            limit: 10,                                        null: false
    t.date    "built_complete",                                                            null: false
    t.string  "ORIGINALLY_BUILT",        limit: 10,                                        null: false
    t.string  "_LOAN2",                  limit: 81,                                        null: false
    t.string  "LOAN2_START_DATE",        limit: 8,                                         null: false
    t.string  "LOAN2_DUE_DATE",          limit: 8,                                         null: false
    t.string  "FORECLOSURE_PRICE",       limit: 3,                                         null: false
    t.string  "LENDER2",                 limit: 19,                                        null: false
    t.string  "CLASSIFICATION",          limit: 10,                                        null: false
    t.string  "FORECLOSURE_DATE",        limit: 9,                                         null: false
  end

  create_table "insider_databankfranchise", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string  "P_NAME",                     limit: 54,  null: false
    t.string  "PROJECT_TYPE",               limit: 17,  null: false
    t.string  "P_STREET_NUMBER",            limit: 45,  null: false
    t.string  "P_STREET_NAME",              limit: 47,  null: false
    t.string  "P_CROSS_STREET_NAME",        limit: 47,  null: false
    t.string  "P_CITY",                     limit: 16,  null: false
    t.string  "P_ZIP",                      limit: 10,  null: false
    t.string  "COUNTY",                     limit: 18,  null: false
    t.string  "DISTRICT2",                  limit: 21,  null: false
    t.string  "SQUARE",                     limit: 24,  null: false
    t.string  "PARCEL",                     limit: 24,  null: false
    t.string  "DEPTH",                      limit: 25,  null: false
    t.string  "WIDTH",                      limit: 10,  null: false
    t.string  "SF_LAND",                    limit: 65,  null: false
    t.date    "land_sale_date"
    t.string  "LAND_SALE_PRICE",            limit: 12,  null: false
    t.string  "PRICE_PER_ACRE",             limit: 25,  null: false
    t.string  "PRICE_PER_SF_LAND",          limit: 5,   null: false
    t.date    "sale_date",                              null: false
    t.string  "SALE_PRICE",                 limit: 21,  null: false
    t.string  "PRICE_PER_SF_BUILDING",      limit: 9,   null: false
    t.string  "TAX_OWNER",                  limit: 87,  null: false
    t.string  "O_STREET_NAME",              limit: 41,  null: false
    t.string  "O_CITY",                     limit: 48,  null: false
    t.string  "O_PHONE",                    limit: 47,  null: false
    t.string  "O_REP",                      limit: 49,  null: false
    t.string  "BUILDER",                    limit: 49,  null: false
    t.string  "B_PHONE",                    limit: 49,  null: false
    t.string  "B_STREET_NAME",              limit: 43,  null: false
    t.string  "B_CITY",                     limit: 50,  null: false
    t.string  "ARCHITECT",                  limit: 47,  null: false
    t.string  "PLANNER",                    limit: 49,  null: false
    t.string  "PREVIOUS_INSIDER_DATE_1",    limit: 9,   null: false
    t.string  "PREVIOUS_INSIDER_DATE_2",    limit: 9,   null: false
    t.string  "PREVIOUS_INSIDER_DATE_3",    limit: 9,   null: false
    t.string  "IMPROVED",                   limit: 57,  null: false
    t.string  "LEGNTH",                     limit: 10,  null: false
    t.string  "SELLER",                     limit: 83,  null: false
    t.string  "S_STREET_NAME",              limit: 43,  null: false
    t.string  "S_CITY",                     limit: 50,  null: false
    t.string  "S_STATE",                    limit: 49,  null: false
    t.string  "BROKER",                     limit: 95,  null: false
    t.string  "BROKER_PHONE",               limit: 46,  null: false
    t.string  "PERMANENT_LOAN",             limit: 15,  null: false
    t.string  "LENDER",                     limit: 58,  null: false
    t.string  "L_STREET_NUMBER",            limit: 41,  null: false
    t.string  "L_CITY",                     limit: 50,  null: false
    t.string  "L_PHONE",                    limit: 49,  null: false
    t.string  "CONSTRUCTION_LOAN",          limit: 19,  null: false
    t.string  "C_LENDER",                   limit: 52,  null: false
    t.string  "C_L_STREET_NUMBER",          limit: 39,  null: false
    t.string  "C_L_CITY",                   limit: 48,  null: false
    t.string  "C_L_PHONE",                  limit: 47,  null: false
    t.string  "C_L_REP",                    limit: 49,  null: false
    t.string  "LEASING_REP",                limit: 44,  null: false
    t.string  "EQUITY",                     limit: 17,  null: false
    t.string  "PERCENTAGE_EQUITY",          limit: 9,   null: false
    t.string  "DOWNPAYMENT",                limit: 15,  null: false
    t.string  "PERCENTAGE_DOWNPAYMENT",     limit: 11,  null: false
    t.string  "UNDERLYING",                 limit: 29,  null: false
    t.string  "PURCHASE_NOTE",              limit: 9,   null: false
    t.string  "ASKING_PRICE",               limit: 10,  null: false
    t.string  "DESCRIPTION",                limit: 58,  null: false
    t.string  "AKA",                        limit: 43,  null: false
    t.string  "SURVEY",                     limit: 10,  null: false
    t.string  "FRONT",                      limit: 25,  null: false
    t.string  "INSIDER_SORT",               limit: 1,   null: false
    t.date    "insider_date",                           null: false
    t.string  "LEASING_PHONE",              limit: 42,  null: false
    t.string  "O_STREET_NUMBER",            limit: 39,  null: false
    t.string  "O_STATE",                    limit: 47,  null: false
    t.string  "O_ZIP",                      limit: 49,  null: false
    t.string  "LEASING_STREET_NUMBER",      limit: 34,  null: false
    t.string  "LEASING_STREET_NAME",        limit: 36,  null: false
    t.string  "LEASING_CITY",               limit: 43,  null: false
    t.string  "LEASING_ZIP",                limit: 44,  null: false
    t.string  "LEASING_SUITE_NUMBER",       limit: 35,  null: false
    t.string  "O_SUITE_NUMBER",             limit: 40,  null: false
    t.string  "LEASING_STATE",              limit: 42,  null: false
    t.string  "P_STATE",                    limit: 9,   null: false
    t.string  "OCCUPIED",                   limit: 9,   null: false
    t.string  "VACANT",                     limit: 9,   null: false
    t.string  "LOW_RENT",                   limit: 14,  null: false
    t.string  "START",                      limit: 8,   null: false
    t.string  "LEASED_PREVIOUS_90_DAYS",    limit: 14,  null: false
    t.string  "M1",                         limit: 68,  null: false
    t.string  "M2",                         limit: 67,  null: false
    t.string  "M3",                         limit: 69,  null: false
    t.string  "M4",                         limit: 71,  null: false
    t.string  "M5",                         limit: 68,  null: false
    t.string  "HIGH_RENT",                  limit: 14,  null: false
    t.string  "LEASING_P_O_BOX_NUMBER",     limit: 33,  null: false
    t.string  "O_P_O_BOX_NUMBER",           limit: 38,  null: false
    t.string  "M6",                         limit: 68,  null: false
    t.string  "M7",                         limit: 67,  null: false
    t.string  "1ST_95",                     limit: 25,  null: false
    t.string  "AFTER_3_YEARS",              limit: 22,  null: false
    t.string  "MARKET_AREA",                limit: 10,  null: false
    t.string  "LEASING_REP2",               limit: 43,  null: false
    t.string  "O_REP2",                     limit: 100, null: false
    t.string  "ANCHOR1",                    limit: 44,  null: false
    t.string  "ANCHOR2",                    limit: 35,  null: false
    t.string  "B_STREET_NUMBER",            limit: 41,  null: false
    t.string  "B_P_O_BOX_NUMBER",           limit: 40,  null: false
    t.string  "B_REP2",                     limit: 50,  null: false
    t.string  "B_REP",                      limit: 51,  null: false
    t.string  "S_STREET_NUMBER",            limit: 41,  null: false
    t.string  "S_P_O_BOX_NUMBER",           limit: 40,  null: false
    t.string  "S_ZIP",                      limit: 51,  null: false
    t.string  "S_PHONE",                    limit: 49,  null: false
    t.string  "S_REP2",                     limit: 98,  null: false
    t.string  "L_REP",                      limit: 51,  null: false
    t.string  "L_REP2",                     limit: 59,  null: false
    t.string  "L_P_O_BOX_NUMBER",           limit: 40,  null: false
    t.string  "L_STREET_NAME",              limit: 43,  null: false
    t.string  "L_STATE",                    limit: 49,  null: false
    t.string  "L_ZIP",                      limit: 51,  null: false
    t.string  "C_L_REP2",                   limit: 48,  null: false
    t.string  "C_L_STREET_NAME",            limit: 41,  null: false
    t.string  "C_L_P_O_BOX_NUMBER",         limit: 38,  null: false
    t.string  "C_L_STATE",                  limit: 47,  null: false
    t.string  "C_L_ZIP",                    limit: 49,  null: false
    t.string  "S_REP",                      limit: 51,  null: false
    t.string  "S_SUITE_NUMBER",             limit: 42,  null: false
    t.string  "B_SUITE_NUMBER",             limit: 42,  null: false
    t.string  "B_STATE",                    limit: 49,  null: false
    t.string  "B_ZIP",                      limit: 51,  null: false
    t.string  "L_SUITE_NUMBER",             limit: 42,  null: false
    t.integer "#_ACRES",                                null: false
    t.integer "#_SQ_FT_BUILT",                          null: false
    t.string  "PREVIOUS_OCCUPIED",          limit: 9,   null: false
    t.string  "PREVIOUS_VACANT",            limit: 9,   null: false
    t.string  "UNBUILT_PHASE_2_SF",         limit: 21,  null: false
    t.string  "PHASE_3_SF",                 limit: 18,  null: false
    t.string  "DISTRICT",                   limit: 20,  null: false
    t.string  "LANDLOT2",                   limit: 22,  null: false
    t.string  "PARCEL2",                    limit: 23,  null: false
    t.string  "PREVIOUS_SQ_FT_BUILT",       limit: 49,  null: false
    t.string  "SECTION",                    limit: 23,  null: false
    t.string  "2ND_OWNER_PHONE",            limit: 40,  null: false
    t.string  "LEASING_PHONE2_FAX",         limit: 55,  null: false
    t.string  "LANDLOT",                    limit: 23,  null: false
    t.string  "CLASSIFICATION",             limit: 51,  null: false
    t.string  "C_L_SUITE_NUMBER",           limit: 40,  null: false
    t.string  "#_OF_BUILDINGS",             limit: 10,  null: false
    t.string  "2ND_OWNER",                  limit: 46,  null: false
    t.string  "CLASSIFICATION2",            limit: 50,  null: false
    t.string  "CLASSIFICATION3",            limit: 50,  null: false
    t.string  "LOAN_PER_SQ_FT",             limit: 9,   null: false
    t.string  "C_LOAN_PER_SQ_FT",           limit: 13,  null: false
    t.string  "2ND_95",                     limit: 19,  null: false
    t.string  "OCCTEST",                    limit: 10,  null: false
    t.date    "FORECLOSURE_DATE",                       null: false
    t.string  "ASSUMED_LOAN",               limit: 27,  null: false
    t.string  "O_PHONE2_FAX",               limit: 81,  null: false
    t.string  "M8",                         limit: 69,  null: false
    t.string  "M9",                         limit: 69,  null: false
    t.string  "M10",                        limit: 68,  null: false
    t.string  "1ST_96",                     limit: 22,  null: false
    t.string  "PHASE_4_SF",                 limit: 17,  null: false
    t.string  "MEDIAN_RENTAL_RATE",         limit: 15,  null: false
    t.string  "LEASE_TERMS",                limit: 7,   null: false
    t.string  "LOAN_START_DATE",            limit: 9,   null: false
    t.string  "LOAN_COMPLETE_DATE",         limit: 9,   null: false
    t.string  "LOAN_TERMS",                 limit: 46,  null: false
    t.string  "C_LOAN_START_DATE",          limit: 9,   null: false
    t.string  "C_LOAN_COMPLETE_DATE",       limit: 9,   null: false
    t.string  "C_LOAN_TERMS",               limit: 44,  null: false
    t.string  "OWNER",                      limit: 53,  null: false
    t.string  "LEASING_COMPANY",            limit: 40,  null: false
    t.string  "LEASE_TERMS_ALLOWANCE",      limit: 7,   null: false
    t.string  "2ND_OWNER_REP",              limit: 42,  null: false
    t.string  "2ND_OWNER_REP2",             limit: 74,  null: false
    t.string  "2ND_OWNER_STREET_NUMBER",    limit: 32,  null: false
    t.string  "2ND_OWNER_P_O_BOX_NUMBER",   limit: 31,  null: false
    t.string  "2ND_OWNER_STREET_NAME",      limit: 34,  null: false
    t.string  "2ND_OWNER_SUITE_NUMBER",     limit: 33,  null: false
    t.string  "2ND_OWNER_CITY",             limit: 41,  null: false
    t.string  "2ND_OWNER_STATE",            limit: 40,  null: false
    t.string  "2ND_OWNER_ZIP",              limit: 42,  null: false
    t.string  "2ND_OWNER_PHONE2_FAX",       limit: 45,  null: false
    t.string  "PERCENTAGE_OCCUPANCY",       limit: 7,   null: false
    t.string  "PERCENTAGE_VACANCY",         limit: 7,   null: false
    t.string  "MANAGEMENT_COMPANY",         limit: 56,  null: false
    t.string  "MANAGEMENT_REP",             limit: 42,  null: false
    t.string  "MANAGEMENT_REP2",            limit: 49,  null: false
    t.string  "MANAGEMENT_STREET_NUMBER",   limit: 32,  null: false
    t.string  "MANAGEMENT_P_O_BOX_NUMBER",  limit: 31,  null: false
    t.string  "MANAGEMENT_STREET_NAME",     limit: 34,  null: false
    t.string  "MANAGEMENT_SUITE_NUMBER",    limit: 33,  null: false
    t.string  "MANAGEMENT_CITY",            limit: 41,  null: false
    t.string  "MANAGEMENT_STATE",           limit: 40,  null: false
    t.string  "MANAGEMENT_ZIP",             limit: 42,  null: false
    t.string  "MANAGEMENT_PHONE",           limit: 40,  null: false
    t.string  "MANAGEMENT_PHONE2_FAX",      limit: 35,  null: false
    t.string  "ATTENTION",                  limit: 45,  null: false
    t.date    "built_complete",                         null: false
    t.string  "ORIGINALLY_BUILT",           limit: 9,   null: false
    t.string  "ATTENTION2",                 limit: 45,  null: false
    t.string  "S_PHONE2_FAX",               limit: 44,  null: false
    t.string  "B_PHONE2_FAX",               limit: 44,  null: false
    t.string  "L_PHONE2_FAX",               limit: 44,  null: false
    t.string  "C_L_PHONE2_FAX",             limit: 42,  null: false
    t.string  "2ND_96",                     limit: 22,  null: false
    t.string  "UNITS",                      limit: 6,   null: false
    t.string  "RESULTS",                    limit: 58,  null: false
    t.string  "INSIDER_DESCRIPTION",        limit: 54,  null: false
    t.string  "PURCHASE_NOTE_START_DATE",   limit: 8,   null: false
    t.string  "PURCHASE_NOTE_DUE_DATE",     limit: 8,   null: false
    t.string  "CAP_RATE",                   limit: 10,  null: false
    t.string  "GROSS_NET",                  limit: 10,  null: false
    t.string  "1ST_97",                     limit: 23,  null: false
    t.string  "FLOORS",                     limit: 6,   null: false
    t.string  "2ND_97",                     limit: 26,  null: false
    t.string  "FORECLOSED_PRICE",           limit: 17,  null: false
    t.string  "ATTORNEY",                   limit: 48,  null: false
    t.string  "ATTORNEY_PHONE",             limit: 42,  null: false
    t.string  "EXISTING_PERMANENT_LOAN",    limit: 24,  null: false
    t.string  "EXISTING_CONSTRUCITON_LOAN", limit: 29,  null: false
    t.string  "PRICE_PER_UNIT",             limit: 18,  null: false
  end

  create_table "insider_databankindustrial", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string  "P_NAME",                     limit: 42,                          null: false
    t.string  "PROJECT_TYPE",               limit: 18,                          null: false
    t.string  "P_STREET_NUMBER",            limit: 1,                           null: false
    t.string  "P_STREET_NAME",              limit: 34,                          null: false
    t.string  "P_CROSS_STREET_NAME",        limit: 49,                          null: false
    t.string  "P_CITY",                     limit: 12,                          null: false
    t.string  "P_ZIP",                      limit: 5,                           null: false
    t.string  "COUNTY",                     limit: 14,                          null: false
    t.string  "DISTRICT2",                  limit: 10,                          null: false
    t.string  "SQUARE",                     limit: 2,                           null: false
    t.string  "PARCEL",                     limit: 5,                           null: false
    t.string  "ZONING",                     limit: 10,                          null: false
    t.string  "ZONING_PERMITTING_DATE",     limit: 10,                          null: false
    t.decimal "SF_LAND",                               precision: 15, scale: 2
    t.date    "land_sale_date",                                                 null: false
    t.integer "LAND_SALE_PRICE",                                                null: false
    t.string  "PRICE_PER_ACRE",             limit: 9,                           null: false
    t.string  "PRICE_PER_SF_LAND",          limit: 10,                          null: false
    t.date    "sale_date",                                                      null: false
    t.integer "SALE_PRICE",                                                     null: false
    t.string  "PRICE_PER_SF_BUILDING",      limit: 10,                          null: false
    t.string  "TAX_OWNER",                  limit: 32,                          null: false
    t.string  "O_STREET_NAME",              limit: 12,                          null: false
    t.string  "O_CITY",                     limit: 13,                          null: false
    t.string  "O_PHONE",                    limit: 14,                          null: false
    t.string  "O_REP",                      limit: 11,                          null: false
    t.string  "BUILDER",                    limit: 10,                          null: false
    t.string  "B_PHONE",                    limit: 10,                          null: false
    t.string  "B_STREET_NAME",              limit: 10,                          null: false
    t.string  "B_CITY",                     limit: 10,                          null: false
    t.string  "ARCHITECT",                  limit: 10,                          null: false
    t.string  "PLANNER",                    limit: 10,                          null: false
    t.string  "PREVIOUS_INSIDER_DATE_1",    limit: 10,                          null: false
    t.string  "PREVIOUS_INSIDER_DATE_2",    limit: 10,                          null: false
    t.string  "PREVIOUS_INSIDER_DATE_3",    limit: 10,                          null: false
    t.string  "MONTHLY_INCOME",             limit: 10,                          null: false
    t.string  "YEARLY_INCOME",              limit: 10,                          null: false
    t.string  "SELLER",                     limit: 28,                          null: false
    t.string  "S_STREET_NAME",              limit: 20,                          null: false
    t.string  "S_CITY",                     limit: 12,                          null: false
    t.string  "S_STATE",                    limit: 2,                           null: false
    t.string  "BROKER",                     limit: 13,                          null: false
    t.string  "BROKER_PHONE",               limit: 10,                          null: false
    t.string  "PERMANENT_LOAN",             limit: 10,                          null: false
    t.string  "LENDER",                     limit: 10,                          null: false
    t.string  "L_STREET_NUMBER",            limit: 10,                          null: false
    t.string  "L_CITY",                     limit: 10,                          null: false
    t.string  "L_PHONE",                    limit: 10,                          null: false
    t.string  "CONSTRUCTION_LOAN",          limit: 10,                          null: false
    t.string  "C_LENDER",                   limit: 10,                          null: false
    t.string  "C_L_STREET_NUMBER",          limit: 10,                          null: false
    t.string  "C_L_CITY",                   limit: 10,                          null: false
    t.string  "C_L_PHONE",                  limit: 10,                          null: false
    t.string  "C_L_REP",                    limit: 10,                          null: false
    t.string  "LEASING_REP",                limit: 10,                          null: false
    t.string  "EQUITY",                     limit: 10,                          null: false
    t.string  "PERCENTAGE_EQUITY",          limit: 10,                          null: false
    t.string  "DOWNPAYMENT",                limit: 10,                          null: false
    t.string  "PERCENTAGE_DOWNPAYMENT",     limit: 10,                          null: false
    t.string  "UNDERLYING",                 limit: 10,                          null: false
    t.string  "PURCHASE_NOTE",              limit: 10,                          null: false
    t.string  "ASKING_PRICE",               limit: 10,                          null: false
    t.string  "DESCRIPTION",                limit: 20,                          null: false
    t.string  "AKA",                        limit: 17,                          null: false
    t.string  "SURVEY",                     limit: 10,                          null: false
    t.string  "RECID",                      limit: 10,                          null: false
    t.string  "INSIDER_SORT",               limit: 10,                          null: false
    t.date    "insider_date",                                                   null: false
    t.string  "LEASING_PHONE",              limit: 10,                          null: false
    t.string  "O_STREET_NUMBER",            limit: 4,                           null: false
    t.string  "O_STATE",                    limit: 2,                           null: false
    t.string  "O_ZIP",                      limit: 5,                           null: false
    t.string  "LEASING_STREET_NUMBER",      limit: 10,                          null: false
    t.string  "LEASING_STREET_NAME",        limit: 10,                          null: false
    t.string  "LEASING_CITY",               limit: 10,                          null: false
    t.string  "LEASING_ZIP",                limit: 10,                          null: false
    t.string  "LEASING_SUITE_NUMBER",       limit: 10,                          null: false
    t.string  "O_SUITE_NUMBER",             limit: 5,                           null: false
    t.string  "LEASING_STATE",              limit: 10,                          null: false
    t.string  "P_STATE",                    limit: 2,                           null: false
    t.string  "OCCUPIED",                   limit: 10,                          null: false
    t.string  "VACANT",                     limit: 10,                          null: false
    t.string  "LOW_RENT",                   limit: 10,                          null: false
    t.string  "START",                      limit: 10,                          null: false
    t.string  "LEASED_PREVIOUS_90_DAYS",    limit: 10,                          null: false
    t.string  "M1",                         limit: 52,                          null: false
    t.string  "M2",                         limit: 43,                          null: false
    t.string  "M3",                         limit: 54,                          null: false
    t.string  "M4",                         limit: 49,                          null: false
    t.string  "M5",                         limit: 51,                          null: false
    t.string  "HIGH_RENT",                  limit: 10,                          null: false
    t.string  "LEASING_P_O_BOX_NUMBER",     limit: 10,                          null: false
    t.string  "O_P_O_BOX_NUMBER",           limit: 10,                          null: false
    t.string  "M6",                         limit: 54,                          null: false
    t.string  "M7",                         limit: 50,                          null: false
    t.string  "2ND_94",                     limit: 10,                          null: false
    t.string  "AFTER_3_YEARS",              limit: 10,                          null: false
    t.string  "MARKET_AREA",                limit: 1,                           null: false
    t.string  "LEASING_REP2",               limit: 10,                          null: false
    t.string  "O_REP2",                     limit: 10,                          null: false
    t.string  "ANCHOR1",                    limit: 32,                          null: false
    t.string  "ANCHOR2",                    limit: 17,                          null: false
    t.string  "B_STREET_NUMBER",            limit: 10,                          null: false
    t.string  "B_P_O_BOX_NUMBER",           limit: 10,                          null: false
    t.string  "B_REP2",                     limit: 10,                          null: false
    t.string  "B_REP",                      limit: 10,                          null: false
    t.string  "S_STREET_NUMBER",            limit: 4,                           null: false
    t.string  "S_P_O_BOX_NUMBER",           limit: 10,                          null: false
    t.string  "S_ZIP",                      limit: 5,                           null: false
    t.string  "S_PHONE",                    limit: 14,                          null: false
    t.string  "S_REP2",                     limit: 16,                          null: false
    t.string  "L_REP",                      limit: 10,                          null: false
    t.string  "L_REP2",                     limit: 10,                          null: false
    t.string  "L_P_O_BOX_NUMBER",           limit: 10,                          null: false
    t.string  "L_STREET_NAME",              limit: 10,                          null: false
    t.string  "L_STATE",                    limit: 10,                          null: false
    t.string  "L_ZIP",                      limit: 10,                          null: false
    t.string  "C_L_REP2",                   limit: 10,                          null: false
    t.string  "C_L_STREET_NAME",            limit: 10,                          null: false
    t.string  "C_L_P_O_BOX_NUMBER",         limit: 10,                          null: false
    t.string  "C_L_STATE",                  limit: 10,                          null: false
    t.string  "C_L_ZIP",                    limit: 10,                          null: false
    t.string  "S_REP",                      limit: 20,                          null: false
    t.string  "S_SUITE_NUMBER",             limit: 10,                          null: false
    t.string  "B_SUITE_NUMBER",             limit: 10,                          null: false
    t.string  "B_STATE",                    limit: 10,                          null: false
    t.string  "B_ZIP",                      limit: 10,                          null: false
    t.string  "L_SUITE_NUMBER",             limit: 10,                          null: false
    t.integer "#_ACRES",                                                        null: false
    t.decimal "#_SQ_FT_BUILT",                         precision: 15, scale: 2
    t.string  "PREVIOUS_OCCUPIED",          limit: 10,                          null: false
    t.string  "PREVIOUS_VACANT",            limit: 10,                          null: false
    t.string  "UNBUILT_PHASE_2_SF",         limit: 10,                          null: false
    t.string  "PHASE_3_SF",                 limit: 10,                          null: false
    t.string  "DISTRICT",                   limit: 3,                           null: false
    t.string  "LANDLOT2",                   limit: 3,                           null: false
    t.string  "PARCEL2",                    limit: 3,                           null: false
    t.string  "PREVIOUS_SQ_FT_BUILT",       limit: 10,                          null: false
    t.string  "SECTION",                    limit: 10,                          null: false
    t.string  "2ND_OWNER_PHONE",            limit: 14,                          null: false
    t.string  "LEASING_PHONE2_FAX",         limit: 10,                          null: false
    t.string  "LANDLOT",                    limit: 4,                           null: false
    t.string  "CLASSIFICATION",             limit: 10,                          null: false
    t.string  "C_L_SUITE_NUMBER",           limit: 10,                          null: false
    t.string  "#_OF_BUILDINGS",             limit: 10,                          null: false
    t.string  "2ND_OWNER",                  limit: 32,                          null: false
    t.string  "CLASSIFICATION2",            limit: 10,                          null: false
    t.string  "CLASSIFICATION3",            limit: 10,                          null: false
    t.string  "LOAN_PER_SQ_FT",             limit: 10,                          null: false
    t.string  "C_LOAN_PER_SQ_FT",           limit: 10,                          null: false
    t.string  "1ST_92",                     limit: 10,                          null: false
    t.string  "OCCTEST",                    limit: 10,                          null: false
    t.date    "foreclosure_date",                                               null: false
    t.string  "ASSUMED_LOAN",               limit: 10,                          null: false
    t.string  "O_PHONE2_FAX",               limit: 14,                          null: false
    t.string  "M8",                         limit: 7,                           null: false
    t.string  "M9",                         limit: 10,                          null: false
    t.string  "M10",                        limit: 10,                          null: false
    t.string  "2ND_92",                     limit: 10,                          null: false
    t.string  "PHASE_4_SF",                 limit: 10,                          null: false
    t.string  "MEDIAN_RENTAL_RATE",         limit: 10,                          null: false
    t.string  "LEASE_TERMS",                limit: 10,                          null: false
    t.string  "LOAN_START_DATE",            limit: 10,                          null: false
    t.string  "LOAN_COMPLETE_DATE",         limit: 10,                          null: false
    t.string  "LOAN_TERMS",                 limit: 10,                          null: false
    t.string  "C_LOAN_START_DATE",          limit: 10,                          null: false
    t.string  "C_LOAN_COMPLETE_DATE",       limit: 10,                          null: false
    t.string  "C_LOAN_TERMS",               limit: 10,                          null: false
    t.string  "OWNER",                      limit: 32,                          null: false
    t.string  "LEASING_COMPANY",            limit: 10,                          null: false
    t.string  "LEASE_TERMS_ALLOWANCE",      limit: 10,                          null: false
    t.string  "2ND_OWNER_REP",              limit: 19,                          null: false
    t.string  "2ND_OWNER_REP2",             limit: 28,                          null: false
    t.string  "2ND_OWNER_STREET_NUMBER",    limit: 7,                           null: false
    t.string  "2ND_OWNER_P_O_BOX_NUMBER",   limit: 10,                          null: false
    t.string  "2ND_OWNER_STREET_NAME",      limit: 12,                          null: false
    t.string  "2ND_OWNER_SUITE_NUMBER",     limit: 10,                          null: false
    t.string  "2ND_OWNER_CITY",             limit: 9,                           null: false
    t.string  "2ND_OWNER_STATE",            limit: 2,                           null: false
    t.string  "2ND_OWNER_ZIP",              limit: 5,                           null: false
    t.string  "2ND_OWNER_PHONE2_FAX",       limit: 10,                          null: false
    t.string  "PERCENTAGE_OCCUPANCY",       limit: 10,                          null: false
    t.string  "PERCENTAGE_VACANCY",         limit: 10,                          null: false
    t.string  "MANAGEMENT_COMPANY",         limit: 10,                          null: false
    t.string  "MANAGEMENT_REP",             limit: 10,                          null: false
    t.string  "MANAGEMENT_REP2",            limit: 10,                          null: false
    t.string  "MANAGEMENT_STREET_NUMBER",   limit: 10,                          null: false
    t.string  "MANAGEMENT_P_O_BOX_NUMBER",  limit: 10,                          null: false
    t.string  "MANAGEMENT_STREET_NAME",     limit: 10,                          null: false
    t.string  "MANAGEMENT_SUITE_NUMBER",    limit: 10,                          null: false
    t.string  "MANAGEMENT_CITY",            limit: 10,                          null: false
    t.string  "MANAGEMENT_STATE",           limit: 10,                          null: false
    t.string  "MANAGEMENT_ZIP",             limit: 10,                          null: false
    t.string  "MANAGEMENT_PHONE",           limit: 10,                          null: false
    t.string  "MANAGEMENT_PHONE2_FAX",      limit: 10,                          null: false
    t.string  "ATTENTION",                  limit: 11,                          null: false
    t.date    "built_complete",                                                 null: false
    t.string  "ORIGINALLY_BUILT",           limit: 9,                           null: false
    t.string  "ATTENTION2",                 limit: 19,                          null: false
    t.string  "S_PHONE2_FAX",               limit: 10,                          null: false
    t.string  "B_PHONE2_FAX",               limit: 10,                          null: false
    t.string  "L_PHONE2_FAX",               limit: 10,                          null: false
    t.string  "C_L_PHONE2_FAX",             limit: 10,                          null: false
    t.string  "1ST_96",                     limit: 10,                          null: false
    t.integer "UNITS"
    t.string  "RESULTS",                    limit: 10,                          null: false
    t.string  "INSIDER_DESCRIPTION",        limit: 20,                          null: false
    t.string  "PURCHASE_NOTE_START_DATE",   limit: 10,                          null: false
    t.string  "PURCHASE_NOTE_DUE_DATE",     limit: 10,                          null: false
    t.string  "CAP_RATE",                   limit: 10,                          null: false
    t.string  "GROSS_NET",                  limit: 10,                          null: false
    t.string  "2ND_96",                     limit: 10,                          null: false
    t.string  "FLOORS",                     limit: 10,                          null: false
    t.string  "1ST_97",                     limit: 10,                          null: false
    t.string  "FORECLOSED_PRICE",           limit: 10,                          null: false
    t.string  "ATTORNEY",                   limit: 13,                          null: false
    t.string  "ATTORNEY_PHONE",             limit: 14,                          null: false
    t.string  "EXISTING_PERMANENT_LOAN",    limit: 10,                          null: false
    t.string  "EXISTING_CONSTRUCITON_LOAN", limit: 10,                          null: false
  end

  create_table "insider_databankland", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string  "P_NAME",                     limit: 42,                          null: false
    t.string  "PROJECT_TYPE",               limit: 18,                          null: false
    t.string  "P_STREET_NUMBER",            limit: 1,                           null: false
    t.string  "P_STREET_NAME",              limit: 34,                          null: false
    t.string  "P_CROSS_STREET_NAME",        limit: 49,                          null: false
    t.string  "P_CITY",                     limit: 12,                          null: false
    t.string  "P_ZIP",                      limit: 5,                           null: false
    t.string  "COUNTY",                     limit: 14,                          null: false
    t.string  "DISTRICT2",                  limit: 10,                          null: false
    t.string  "SQUARE",                     limit: 2,                           null: false
    t.string  "PARCEL",                     limit: 5,                           null: false
    t.string  "ZONING",                     limit: 10,                          null: false
    t.string  "ZONING_PERMITTING_DATE",     limit: 10,                          null: false
    t.decimal "SF_LAND",                               precision: 15, scale: 2
    t.date    "land_sale_date",                                                 null: false
    t.integer "LAND_SALE_PRICE",                                                null: false
    t.string  "PRICE_PER_ACRE",             limit: 9,                           null: false
    t.string  "PRICE_PER_SF_LAND",          limit: 10,                          null: false
    t.date    "sale_date",                                                      null: false
    t.integer "SALE_PRICE"
    t.string  "PRICE_PER_SF_BUILDING",      limit: 10,                          null: false
    t.string  "TAX_OWNER",                  limit: 32,                          null: false
    t.string  "O_STREET_NAME",              limit: 12,                          null: false
    t.string  "O_CITY",                     limit: 13,                          null: false
    t.string  "O_PHONE",                    limit: 14,                          null: false
    t.string  "O_REP",                      limit: 11,                          null: false
    t.string  "BUILDER",                    limit: 10,                          null: false
    t.string  "B_PHONE",                    limit: 10,                          null: false
    t.string  "B_STREET_NAME",              limit: 10,                          null: false
    t.string  "B_CITY",                     limit: 10,                          null: false
    t.string  "ARCHITECT",                  limit: 10,                          null: false
    t.string  "PLANNER",                    limit: 10,                          null: false
    t.string  "PREVIOUS_INSIDER_DATE_1",    limit: 10,                          null: false
    t.string  "PREVIOUS_INSIDER_DATE_2",    limit: 10,                          null: false
    t.string  "PREVIOUS_INSIDER_DATE_3",    limit: 10,                          null: false
    t.string  "MONTHLY_INCOME",             limit: 10,                          null: false
    t.string  "YEARLY_INCOME",              limit: 10,                          null: false
    t.string  "SELLER",                     limit: 28,                          null: false
    t.string  "S_STREET_NAME",              limit: 20,                          null: false
    t.string  "S_CITY",                     limit: 12,                          null: false
    t.string  "S_STATE",                    limit: 2,                           null: false
    t.string  "BROKER",                     limit: 13,                          null: false
    t.string  "BROKER_PHONE",               limit: 10,                          null: false
    t.string  "PERMANENT_LOAN",             limit: 10,                          null: false
    t.string  "LENDER",                     limit: 10,                          null: false
    t.string  "L_STREET_NUMBER",            limit: 10,                          null: false
    t.string  "L_CITY",                     limit: 10,                          null: false
    t.string  "L_PHONE",                    limit: 10,                          null: false
    t.string  "CONSTRUCTION_LOAN",          limit: 10,                          null: false
    t.string  "C_LENDER",                   limit: 10,                          null: false
    t.string  "C_L_STREET_NUMBER",          limit: 10,                          null: false
    t.string  "C_L_CITY",                   limit: 10,                          null: false
    t.string  "C_L_PHONE",                  limit: 10,                          null: false
    t.string  "C_L_REP",                    limit: 10,                          null: false
    t.string  "LEASING_REP",                limit: 10,                          null: false
    t.string  "EQUITY",                     limit: 10,                          null: false
    t.string  "PERCENTAGE_EQUITY",          limit: 10,                          null: false
    t.string  "DOWNPAYMENT",                limit: 10,                          null: false
    t.string  "PERCENTAGE_DOWNPAYMENT",     limit: 10,                          null: false
    t.string  "UNDERLYING",                 limit: 10,                          null: false
    t.string  "PURCHASE_NOTE",              limit: 10,                          null: false
    t.string  "ASKING_PRICE",               limit: 10,                          null: false
    t.string  "DESCRIPTION",                limit: 20,                          null: false
    t.string  "AKA",                        limit: 17,                          null: false
    t.string  "SURVEY",                     limit: 10,                          null: false
    t.string  "RECID",                      limit: 10,                          null: false
    t.string  "INSIDER_SORT",               limit: 10,                          null: false
    t.date    "insider_date",                                                   null: false
    t.string  "LEASING_PHONE",              limit: 10,                          null: false
    t.string  "O_STREET_NUMBER",            limit: 4,                           null: false
    t.string  "O_STATE",                    limit: 2,                           null: false
    t.string  "O_ZIP",                      limit: 5,                           null: false
    t.string  "LEASING_STREET_NUMBER",      limit: 10,                          null: false
    t.string  "LEASING_STREET_NAME",        limit: 10,                          null: false
    t.string  "LEASING_CITY",               limit: 10,                          null: false
    t.string  "LEASING_ZIP",                limit: 10,                          null: false
    t.string  "LEASING_SUITE_NUMBER",       limit: 10,                          null: false
    t.string  "O_SUITE_NUMBER",             limit: 5,                           null: false
    t.string  "LEASING_STATE",              limit: 10,                          null: false
    t.string  "P_STATE",                    limit: 2,                           null: false
    t.string  "OCCUPIED",                   limit: 10,                          null: false
    t.string  "VACANT",                     limit: 10,                          null: false
    t.string  "LOW_RENT",                   limit: 10,                          null: false
    t.string  "START",                      limit: 10,                          null: false
    t.string  "LEASED_PREVIOUS_90_DAYS",    limit: 10,                          null: false
    t.string  "M1",                         limit: 52,                          null: false
    t.string  "M2",                         limit: 43,                          null: false
    t.string  "M3",                         limit: 54,                          null: false
    t.string  "M4",                         limit: 49,                          null: false
    t.string  "M5",                         limit: 51,                          null: false
    t.string  "HIGH_RENT",                  limit: 10,                          null: false
    t.string  "LEASING_P_O_BOX_NUMBER",     limit: 10,                          null: false
    t.string  "O_P_O_BOX_NUMBER",           limit: 10,                          null: false
    t.string  "M6",                         limit: 54,                          null: false
    t.string  "M7",                         limit: 50,                          null: false
    t.string  "2ND_94",                     limit: 10,                          null: false
    t.string  "AFTER_3_YEARS",              limit: 10,                          null: false
    t.string  "MARKET_AREA",                limit: 1,                           null: false
    t.string  "LEASING_REP2",               limit: 10,                          null: false
    t.string  "O_REP2",                     limit: 10,                          null: false
    t.string  "ANCHOR1",                    limit: 32,                          null: false
    t.string  "ANCHOR2",                    limit: 17,                          null: false
    t.string  "B_STREET_NUMBER",            limit: 10,                          null: false
    t.string  "B_P_O_BOX_NUMBER",           limit: 10,                          null: false
    t.string  "B_REP2",                     limit: 10,                          null: false
    t.string  "B_REP",                      limit: 10,                          null: false
    t.string  "S_STREET_NUMBER",            limit: 4,                           null: false
    t.string  "S_P_O_BOX_NUMBER",           limit: 10,                          null: false
    t.string  "S_ZIP",                      limit: 5,                           null: false
    t.string  "S_PHONE",                    limit: 14,                          null: false
    t.string  "S_REP2",                     limit: 16,                          null: false
    t.string  "L_REP",                      limit: 10,                          null: false
    t.string  "L_REP2",                     limit: 10,                          null: false
    t.string  "L_P_O_BOX_NUMBER",           limit: 10,                          null: false
    t.string  "L_STREET_NAME",              limit: 10,                          null: false
    t.string  "L_STATE",                    limit: 10,                          null: false
    t.string  "L_ZIP",                      limit: 10,                          null: false
    t.string  "C_L_REP2",                   limit: 10,                          null: false
    t.string  "C_L_STREET_NAME",            limit: 10,                          null: false
    t.string  "C_L_P_O_BOX_NUMBER",         limit: 10,                          null: false
    t.string  "C_L_STATE",                  limit: 10,                          null: false
    t.string  "C_L_ZIP",                    limit: 10,                          null: false
    t.string  "S_REP",                      limit: 20,                          null: false
    t.string  "S_SUITE_NUMBER",             limit: 10,                          null: false
    t.string  "B_SUITE_NUMBER",             limit: 10,                          null: false
    t.string  "B_STATE",                    limit: 10,                          null: false
    t.string  "B_ZIP",                      limit: 10,                          null: false
    t.string  "L_SUITE_NUMBER",             limit: 10,                          null: false
    t.integer "#_ACRES",                                                        null: false
    t.decimal "#_SQ_FT_BUILT",                         precision: 15, scale: 2
    t.string  "PREVIOUS_OCCUPIED",          limit: 10,                          null: false
    t.string  "PREVIOUS_VACANT",            limit: 10,                          null: false
    t.string  "UNBUILT_PHASE_2_SF",         limit: 10,                          null: false
    t.string  "PHASE_3_SF",                 limit: 10,                          null: false
    t.string  "DISTRICT",                   limit: 3,                           null: false
    t.string  "LANDLOT2",                   limit: 3,                           null: false
    t.string  "PARCEL2",                    limit: 3,                           null: false
    t.string  "PREVIOUS_SQ_FT_BUILT",       limit: 10,                          null: false
    t.string  "SECTION",                    limit: 10,                          null: false
    t.string  "2ND_OWNER_PHONE",            limit: 14,                          null: false
    t.string  "LEASING_PHONE2_FAX",         limit: 10,                          null: false
    t.string  "LANDLOT",                    limit: 4,                           null: false
    t.string  "CLASSIFICATION",             limit: 10,                          null: false
    t.string  "C_L_SUITE_NUMBER",           limit: 10,                          null: false
    t.string  "#_OF_BUILDINGS",             limit: 10,                          null: false
    t.string  "2ND_OWNER",                  limit: 32,                          null: false
    t.string  "CLASSIFICATION2",            limit: 10,                          null: false
    t.string  "CLASSIFICATION3",            limit: 10,                          null: false
    t.string  "LOAN_PER_SQ_FT",             limit: 10,                          null: false
    t.string  "C_LOAN_PER_SQ_FT",           limit: 10,                          null: false
    t.string  "1ST_92",                     limit: 10,                          null: false
    t.string  "OCCTEST",                    limit: 10,                          null: false
    t.date    "foreclosure_date",                                               null: false
    t.string  "ASSUMED_LOAN",               limit: 10,                          null: false
    t.string  "O_PHONE2_FAX",               limit: 14,                          null: false
    t.string  "M8",                         limit: 7,                           null: false
    t.string  "M9",                         limit: 10,                          null: false
    t.string  "M10",                        limit: 10,                          null: false
    t.string  "2ND_92",                     limit: 10,                          null: false
    t.string  "PHASE_4_SF",                 limit: 10,                          null: false
    t.string  "MEDIAN_RENTAL_RATE",         limit: 10,                          null: false
    t.string  "LEASE_TERMS",                limit: 10,                          null: false
    t.string  "LOAN_START_DATE",            limit: 10,                          null: false
    t.string  "LOAN_COMPLETE_DATE",         limit: 10,                          null: false
    t.string  "LOAN_TERMS",                 limit: 10,                          null: false
    t.string  "C_LOAN_START_DATE",          limit: 10,                          null: false
    t.string  "C_LOAN_COMPLETE_DATE",       limit: 10,                          null: false
    t.string  "C_LOAN_TERMS",               limit: 10,                          null: false
    t.string  "OWNER",                      limit: 32,                          null: false
    t.string  "LEASING_COMPANY",            limit: 10,                          null: false
    t.string  "LEASE_TERMS_ALLOWANCE",      limit: 10,                          null: false
    t.string  "2ND_OWNER_REP",              limit: 19,                          null: false
    t.string  "2ND_OWNER_REP2",             limit: 28,                          null: false
    t.string  "2ND_OWNER_STREET_NUMBER",    limit: 7,                           null: false
    t.string  "2ND_OWNER_P_O_BOX_NUMBER",   limit: 10,                          null: false
    t.string  "2ND_OWNER_STREET_NAME",      limit: 12,                          null: false
    t.string  "2ND_OWNER_SUITE_NUMBER",     limit: 10,                          null: false
    t.string  "2ND_OWNER_CITY",             limit: 9,                           null: false
    t.string  "2ND_OWNER_STATE",            limit: 2,                           null: false
    t.string  "2ND_OWNER_ZIP",              limit: 5,                           null: false
    t.string  "2ND_OWNER_PHONE2_FAX",       limit: 10,                          null: false
    t.string  "PERCENTAGE_OCCUPANCY",       limit: 10,                          null: false
    t.string  "PERCENTAGE_VACANCY",         limit: 10,                          null: false
    t.string  "MANAGEMENT_COMPANY",         limit: 10,                          null: false
    t.string  "MANAGEMENT_REP",             limit: 10,                          null: false
    t.string  "MANAGEMENT_REP2",            limit: 10,                          null: false
    t.string  "MANAGEMENT_STREET_NUMBER",   limit: 10,                          null: false
    t.string  "MANAGEMENT_P_O_BOX_NUMBER",  limit: 10,                          null: false
    t.string  "MANAGEMENT_STREET_NAME",     limit: 10,                          null: false
    t.string  "MANAGEMENT_SUITE_NUMBER",    limit: 10,                          null: false
    t.string  "MANAGEMENT_CITY",            limit: 10,                          null: false
    t.string  "MANAGEMENT_STATE",           limit: 10,                          null: false
    t.string  "MANAGEMENT_ZIP",             limit: 10,                          null: false
    t.string  "MANAGEMENT_PHONE",           limit: 10,                          null: false
    t.string  "MANAGEMENT_PHONE2_FAX",      limit: 10,                          null: false
    t.string  "ATTENTION",                  limit: 11,                          null: false
    t.date    "built_complete",                                                 null: false
    t.string  "ORIGINALLY_BUILT",           limit: 9,                           null: false
    t.string  "ATTENTION2",                 limit: 19,                          null: false
    t.string  "S_PHONE2_FAX",               limit: 10,                          null: false
    t.string  "B_PHONE2_FAX",               limit: 10,                          null: false
    t.string  "L_PHONE2_FAX",               limit: 10,                          null: false
    t.string  "C_L_PHONE2_FAX",             limit: 10,                          null: false
    t.string  "1ST_96",                     limit: 10,                          null: false
    t.integer "UNITS"
    t.string  "RESULTS",                    limit: 10,                          null: false
    t.string  "INSIDER_DESCRIPTION",        limit: 20,                          null: false
    t.string  "PURCHASE_NOTE_START_DATE",   limit: 10,                          null: false
    t.string  "PURCHASE_NOTE_DUE_DATE",     limit: 10,                          null: false
    t.string  "CAP_RATE",                   limit: 10,                          null: false
    t.string  "GROSS_NET",                  limit: 10,                          null: false
    t.string  "2ND_96",                     limit: 10,                          null: false
    t.string  "FLOORS",                     limit: 10,                          null: false
    t.string  "1ST_97",                     limit: 10,                          null: false
    t.string  "FORECLOSED_PRICE",           limit: 10,                          null: false
    t.string  "ATTORNEY",                   limit: 13,                          null: false
    t.string  "ATTORNEY_PHONE",             limit: 14,                          null: false
    t.string  "EXISTING_PERMANENT_LOAN",    limit: 10,                          null: false
    t.string  "EXISTING_CONSTRUCITON_LOAN", limit: 10,                          null: false
  end

  create_table "insider_databankoffshop", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string  "P_NAME",                     limit: 154,                          null: false
    t.string  "PROJECT_TYPE",               limit: 61,                           null: false
    t.string  "P_STREET_NUMBER",            limit: 59,                           null: false
    t.string  "P_STREET_NAME",              limit: 85,                           null: false
    t.string  "P_CROSS_STREET_NAME",        limit: 104,                          null: false
    t.string  "P_CITY",                     limit: 67,                           null: false
    t.string  "P_ZIP",                      limit: 68,                           null: false
    t.string  "COUNTY",                     limit: 16,                           null: false
    t.string  "DISTRICT2",                  limit: 24,                           null: false
    t.string  "SQUARE",                     limit: 27,                           null: false
    t.string  "PARCEL",                     limit: 27,                           null: false
    t.string  "ZONING",                     limit: 34,                           null: false
    t.string  "ZONING_PERMITTING_DATE",     limit: 9,                            null: false
    t.decimal "SF_LAND",                                precision: 15, scale: 2
    t.date    "land_sale_date"
    t.integer "LAND_SALE_PRICE",                                                 null: false
    t.string  "PRICE_PER_ACRE",             limit: 12,                           null: false
    t.string  "PRICE_PER_SF_LAND",          limit: 5,                            null: false
    t.date    "sale_date"
    t.string  "SALE_PRICE",                 limit: 17,                           null: false
    t.string  "PRICE_PER_SF_BUILDING",      limit: 7,                            null: false
    t.string  "TAX_OWNER",                  limit: 132,                          null: false
    t.string  "O_STREET_NAME",              limit: 41,                           null: false
    t.string  "O_CITY",                     limit: 43,                           null: false
    t.string  "O_PHONE",                    limit: 41,                           null: false
    t.string  "O_REP",                      limit: 41,                           null: false
    t.string  "B_STREET_NAME",              limit: 29,                           null: false
    t.string  "B_CITY",                     limit: 40,                           null: false
    t.string  "ARCHITECT",                  limit: 72,                           null: false
    t.string  "PLANNER",                    limit: 70,                           null: false
    t.string  "PREVIOUS_INSIDER_DATE_1",    limit: 9,                            null: false
    t.string  "PREVIOUS_INSIDER_DATE_2",    limit: 9,                            null: false
    t.string  "PREVIOUS_INSIDER_DATE_3",    limit: 9,                            null: false
    t.string  "YEARLY_INCOME",              limit: 23,                           null: false
    t.string  "SELLER",                     limit: 153,                          null: false
    t.string  "S_STREET_NAME",              limit: 43,                           null: false
    t.string  "S_CITY",                     limit: 35,                           null: false
    t.string  "S_STATE",                    limit: 34,                           null: false
    t.string  "BROKER",                     limit: 96,                           null: false
    t.string  "BROKER_PHONE",               limit: 41,                           null: false
    t.string  "PERMANENT_LOAN",             limit: 24,                           null: false
    t.string  "LENDER",                     limit: 144,                          null: false
    t.string  "L_STREET_NUMBER",            limit: 31,                           null: false
    t.string  "L_CITY",                     limit: 40,                           null: false
    t.string  "L_PHONE",                    limit: 59,                           null: false
    t.string  "CONSTRUCTION_LOAN",          limit: 33,                           null: false
    t.string  "C_LENDER",                   limit: 106,                          null: false
    t.string  "C_L_STREET_NUMBER",          limit: 28,                           null: false
    t.string  "C_L_CITY",                   limit: 37,                           null: false
    t.string  "C_L_PHONE",                  limit: 36,                           null: false
    t.string  "C_L_REP",                    limit: 43,                           null: false
    t.string  "LEASING_REP",                limit: 35,                           null: false
    t.string  "EQUITY",                     limit: 24,                           null: false
    t.string  "PERCENTAGE_EQUITY",          limit: 9,                            null: false
    t.string  "DOWNPAYMENT",                limit: 23,                           null: false
    t.string  "PERCENTAGE_DOWNPAYMENT",     limit: 10,                           null: false
    t.string  "UNDERLYING",                 limit: 23,                           null: false
    t.string  "PURCHASE_NOTE",              limit: 23,                           null: false
    t.string  "ASKING_PRICE",               limit: 10,                           null: false
    t.string  "DESCRIPTION",                limit: 64,                           null: false
    t.string  "AKA",                        limit: 125,                          null: false
    t.string  "SURVEY",                     limit: 66,                           null: false
    t.string  "PERMITTED",                  limit: 9,                            null: false
    t.string  "INSIDER_SORT",               limit: 8,                            null: false
    t.date    "insider_date",                                                    null: false
    t.string  "LEASING_PHONE",              limit: 33,                           null: false
    t.string  "O_STREET_NUMBER",            limit: 33,                           null: false
    t.string  "O_STATE",                    limit: 41,                           null: false
    t.string  "O_ZIP",                      limit: 44,                           null: false
    t.string  "LEASING_STREET_NUMBER",      limit: 25,                           null: false
    t.string  "LEASING_STREET_NAME",        limit: 36,                           null: false
    t.string  "LEASING_CITY",               limit: 34,                           null: false
    t.string  "LEASING_ZIP",                limit: 35,                           null: false
    t.string  "LEASING_SUITE_NUMBER",       limit: 26,                           null: false
    t.string  "O_SUITE_NUMBER",             limit: 36,                           null: false
    t.string  "LEASING_STATE",              limit: 33,                           null: false
    t.string  "P_STATE",                    limit: 66,                           null: false
    t.string  "OCCUPIED",                   limit: 26,                           null: false
    t.string  "VACANT",                     limit: 31,                           null: false
    t.string  "LOW_RENT",                   limit: 22,                           null: false
    t.string  "START",                      limit: 9,                            null: false
    t.string  "LEASED_PREVIOUS_90_DAYS",    limit: 26,                           null: false
    t.string  "M1",                         limit: 74,                           null: false
    t.string  "M2",                         limit: 77,                           null: false
    t.string  "M3",                         limit: 71,                           null: false
    t.string  "M4",                         limit: 71,                           null: false
    t.string  "M5",                         limit: 71,                           null: false
    t.string  "HIGH_RENT",                  limit: 24,                           null: false
    t.string  "LEASING_P_O_BOX_NUMBER",     limit: 24,                           null: false
    t.string  "O_P_O_BOX_NUMBER",           limit: 34,                           null: false
    t.string  "M6",                         limit: 71,                           null: false
    t.string  "M7",                         limit: 71,                           null: false
    t.string  "2ND_97",                     limit: 25,                           null: false
    t.string  "AFTER_3_YEARS",              limit: 21,                           null: false
    t.string  "MARKET_AREA",                limit: 11,                           null: false
    t.string  "LEASING_REP2",               limit: 131,                          null: false
    t.string  "O_REP2",                     limit: 173,                          null: false
    t.string  "ANCHOR1",                    limit: 79,                           null: false
    t.string  "ANCHOR2",                    limit: 150,                          null: false
    t.string  "B_STREET_NUMBER",            limit: 37,                           null: false
    t.string  "B_P_O_BOX_NUMBER",           limit: 40,                           null: false
    t.string  "B_REP2",                     limit: 92,                           null: false
    t.string  "B_REP",                      limit: 39,                           null: false
    t.string  "S_STREET_NUMBER",            limit: 41,                           null: false
    t.string  "S_P_O_BOX_NUMBER",           limit: 36,                           null: false
    t.string  "S_ZIP",                      limit: 34,                           null: false
    t.string  "S_PHONE",                    limit: 36,                           null: false
    t.string  "S_REP2",                     limit: 138,                          null: false
    t.string  "L_REP",                      limit: 57,                           null: false
    t.string  "L_REP2",                     limit: 141,                          null: false
    t.string  "L_P_O_BOX_NUMBER",           limit: 30,                           null: false
    t.string  "L_STREET_NAME",              limit: 42,                           null: false
    t.string  "L_STATE",                    limit: 39,                           null: false
    t.string  "L_ZIP",                      limit: 41,                           null: false
    t.string  "C_L_REP2",                   limit: 95,                           null: false
    t.string  "C_L_STREET_NAME",            limit: 30,                           null: false
    t.string  "C_L_P_O_BOX_NUMBER",         limit: 27,                           null: false
    t.string  "C_L_STATE",                  limit: 36,                           null: false
    t.string  "C_L_ZIP",                    limit: 38,                           null: false
    t.string  "S_REP",                      limit: 60,                           null: false
    t.string  "S_SUITE_NUMBER",             limit: 36,                           null: false
    t.string  "B_SUITE_NUMBER",             limit: 39,                           null: false
    t.string  "B_STATE",                    limit: 41,                           null: false
    t.string  "B_ZIP",                      limit: 41,                           null: false
    t.string  "L_SUITE_NUMBER",             limit: 32,                           null: false
    t.integer "#_ACRES",                                                         null: false
    t.decimal "#_SQ_FT_BUILT",                          precision: 15, scale: 2
    t.string  "PREVIOUS_OCCUPIED",          limit: 22,                           null: false
    t.string  "PREVIOUS_VACANT",            limit: 33,                           null: false
    t.string  "UNBUILT_PHASE_2_SF",         limit: 19,                           null: false
    t.string  "PHASE_3_SF",                 limit: 21,                           null: false
    t.string  "DISTRICT",                   limit: 25,                           null: false
    t.string  "LANDLOT2",                   limit: 37,                           null: false
    t.string  "PARCEL2",                    limit: 71,                           null: false
    t.string  "PREVIOUS_SQ_FT_BUILT",       limit: 15,                           null: false
    t.string  "SECTION",                    limit: 26,                           null: false
    t.string  "2ND_OWNER_PHONE",            limit: 32,                           null: false
    t.string  "LEASING_PHONE2",             limit: 93,                           null: false
    t.string  "LANDLOT",                    limit: 26,                           null: false
    t.string  "CLASSIFICATION",             limit: 58,                           null: false
    t.string  "C_L_SUITE_NUMBER",           limit: 29,                           null: false
    t.string  "#_OF_BUILDINGS",             limit: 30,                           null: false
    t.string  "2ND_OWNER",                  limit: 102,                          null: false
    t.string  "CLASSIFICATION2",            limit: 57,                           null: false
    t.string  "CLASSIFICATION3",            limit: 57,                           null: false
    t.string  "LOAN_PER_SQ_FT",             limit: 5,                            null: false
    t.string  "C_LOAN_PER_SQ_FT",           limit: 13,                           null: false
    t.string  "1ST_98",                     limit: 23,                           null: false
    t.string  "OCCTEST",                    limit: 7,                            null: false
    t.date    "foreclosure_date"
    t.string  "ASSUMED_LOAN",               limit: 20,                           null: false
    t.string  "O_PHONE2_FAX",               limit: 101,                          null: false
    t.string  "M8",                         limit: 71,                           null: false
    t.string  "M9",                         limit: 71,                           null: false
    t.string  "M10",                        limit: 71,                           null: false
    t.string  "2ND_95",                     limit: 23,                           null: false
    t.string  "PHASE_4_SF",                 limit: 21,                           null: false
    t.string  "MEDIAN_RENTAL_RATE",         limit: 15,                           null: false
    t.string  "LEASE_TERMS",                limit: 21,                           null: false
    t.string  "LOAN_START_DATE",            limit: 9,                            null: false
    t.string  "LOAN_COMPLETE_DATE",         limit: 9,                            null: false
    t.string  "LOAN_TERMS",                 limit: 24,                           null: false
    t.string  "C_LOAN_START_DATE",          limit: 9,                            null: false
    t.string  "C_LOAN_COMPLETE_DATE",       limit: 9,                            null: false
    t.string  "C_LOAN_TERMS",               limit: 47,                           null: false
    t.string  "OWNER",                      limit: 172,                          null: false
    t.string  "LEASING_COMPANY",            limit: 60,                           null: false
    t.string  "LEASE_TERMS_ALLOWANCE",      limit: 17,                           null: false
    t.string  "2ND_OWNER_REP",              limit: 38,                           null: false
    t.string  "2ND_OWNER_REP2",             limit: 118,                          null: false
    t.string  "2ND_OWNER_STREET_NUMBER",    limit: 29,                           null: false
    t.string  "2ND_OWNER_P_O_BOX_NUMBER",   limit: 33,                           null: false
    t.string  "2ND_OWNER_STREET_NAME",      limit: 31,                           null: false
    t.string  "2ND_OWNER_SUITE_NUMBER",     limit: 36,                           null: false
    t.string  "2ND_OWNER_CITY",             limit: 37,                           null: false
    t.string  "2ND_OWNER_STATE",            limit: 33,                           null: false
    t.string  "2ND_OWNER_ZIP",              limit: 41,                           null: false
    t.string  "2ND_OWNER_PHONE2_FAX",       limit: 63,                           null: false
    t.string  "FAX",                        limit: 44,                           null: false
    t.string  "PERCENTAGE_VACANCY",         limit: 11,                           null: false
    t.string  "MANAGEMENT_COMPANY",         limit: 69,                           null: false
    t.string  "MANAGEMENT_REP",             limit: 38,                           null: false
    t.string  "MANAGEMENT_REP2",            limit: 110,                          null: false
    t.string  "MANAGEMENT_STREET_NUMBER",   limit: 34,                           null: false
    t.string  "MANAGEMENT_P_O_BOX_NUMBER",  limit: 35,                           null: false
    t.string  "MANAGEMENT_STREET_NAME",     limit: 38,                           null: false
    t.string  "MANAGEMENT_SUITE_NUMBER",    limit: 36,                           null: false
    t.string  "MANAGEMENT_CITY",            limit: 36,                           null: false
    t.string  "MANAGEMENT_STATE",           limit: 35,                           null: false
    t.string  "MANAGEMENT_ZIP",             limit: 40,                           null: false
    t.string  "MANAGEMENT_PHONE",           limit: 35,                           null: false
    t.string  "MANAGEMENT_PHONE2_FAX",      limit: 55,                           null: false
    t.string  "ATTENTION",                  limit: 66,                           null: false
    t.date    "built_complete",                                                  null: false
    t.string  "ORIGINALLY_BUILT",           limit: 17,                           null: false
    t.string  "ATTENTION2",                 limit: 55,                           null: false
    t.string  "S_PHONE2_FAX",               limit: 87,                           null: false
    t.string  "B_PHONE2_FAX",               limit: 52,                           null: false
    t.string  "L_PHONE2_FAX",               limit: 104,                          null: false
    t.string  "C_L_PHONE2_FAX",             limit: 82,                           null: false
    t.string  "1ST_96",                     limit: 25,                           null: false
    t.integer "UNITS"
    t.string  "RESULTS",                    limit: 66,                           null: false
    t.string  "INSIDER_DESCRIPTION",        limit: 69,                           null: false
    t.string  "PURCHASE_NOTE_START_DATE",   limit: 9,                            null: false
    t.string  "PURCHASE_NOTE_DUE_DATE",     limit: 9,                            null: false
    t.string  "CAP_RATE",                   limit: 8,                            null: false
    t.string  "GROSS_NET",                  limit: 21,                           null: false
    t.string  "2ND_96",                     limit: 26,                           null: false
    t.string  "FLOORS",                     limit: 20,                           null: false
    t.string  "1ST_97",                     limit: 150,                          null: false
    t.string  "FORECLOSED_PRICE",           limit: 132,                          null: false
    t.string  "ATTORNEY",                   limit: 82,                           null: false
    t.string  "ATTORNEY_PHONE",             limit: 58,                           null: false
    t.string  "EXISTING_PERMANENT_LOAN",    limit: 165,                          null: false
    t.string  "EXISTING_CONSTRUCITON_LOAN", limit: 165,                          null: false
    t.string  "KEY_PLAYER",                 limit: 66,                           null: false
  end

  create_table "insider_insideruser", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "user_id",                    null: false
    t.boolean "apartment",                  null: false
    t.boolean "retail",                     null: false
    t.boolean "land",                       null: false
    t.boolean "offshop",                    null: false
    t.boolean "industrial",                 null: false
    t.integer "reportcount"
    t.string  "company_name",   limit: 100, null: false
    t.string  "company_street", limit: 100, null: false
    t.string  "company_city",   limit: 100, null: false
    t.string  "company_state",  limit: 2,   null: false
    t.integer "company_zip"
    t.string  "company_number", limit: 11
    t.index ["user_id"], name: "user_id", unique: true, using: :btree
  end

end
