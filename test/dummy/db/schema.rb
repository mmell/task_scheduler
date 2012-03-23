# encoding: UTF-8
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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120321192113) do

  create_table "task_scheduler_scheduled_task_runs", :force => true do |t|
    t.integer  "scheduled_task_id"
    t.text     "report"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "task_scheduler_scheduled_tasks", :force => true do |t|
    t.string   "rake_method"
    t.string   "args"
    t.string   "args_sep"
    t.string   "notify_email"
    t.integer  "interval_seconds"
    t.datetime "next_run"
    t.datetime "last_run"
    t.integer  "state"
    t.datetime "started"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

end
