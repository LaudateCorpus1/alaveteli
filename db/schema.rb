# This file is autogenerated. Instead of editing this file, please use the
# migrations feature of ActiveRecord to incrementally modify your database, and
# then regenerate this schema definition.

ActiveRecord::Schema.define(:version => 22) do

  create_table "incoming_messages", :force => true do |t|
    t.column "info_request_id",      :integer
    t.column "raw_data",             :text
    t.column "created_at",           :datetime
    t.column "updated_at",           :datetime
    t.column "user_classified",      :boolean,  :default => false
    t.column "contains_information", :boolean
  end

  create_table "info_request_events", :force => true do |t|
    t.column "info_request_id", :integer
    t.column "event_type",      :text
    t.column "params_yaml",     :text
    t.column "created_at",      :datetime
  end

  create_table "info_requests", :force => true do |t|
    t.column "title",          :text
    t.column "user_id",        :integer
    t.column "public_body_id", :integer
    t.column "created_at",     :datetime
    t.column "updated_at",     :datetime
  end

  create_table "outgoing_messages", :force => true do |t|
    t.column "info_request_id", :integer
    t.column "body",            :text
    t.column "status",          :string
    t.column "message_type",    :string
    t.column "created_at",      :datetime
    t.column "updated_at",      :datetime
    t.column "sent_at",         :datetime
  end

  create_table "post_redirects", :force => true do |t|
    t.column "token",              :text
    t.column "uri",                :text
    t.column "post_params_yaml",   :text
    t.column "created_at",         :datetime
    t.column "updated_at",         :datetime
    t.column "email_token",        :text
    t.column "reason_params_yaml", :text
    t.column "user_id",            :integer
  end

  create_table "public_bodies", :force => true do |t|
    t.column "name",              :text
    t.column "short_name",        :text
    t.column "request_email",     :text
    t.column "complaint_email",   :text
    t.column "version",           :integer
    t.column "last_edit_editor",  :string
    t.column "last_edit_comment", :string
    t.column "created_at",        :datetime
    t.column "updated_at",        :datetime
  end

  create_table "public_body_versions", :force => true do |t|
    t.column "public_body_id",    :integer
    t.column "version",           :integer
    t.column "name",              :text
    t.column "short_name",        :text
    t.column "request_email",     :text
    t.column "complaint_email",   :text
    t.column "updated_at",        :datetime
    t.column "last_edit_editor",  :string
    t.column "last_edit_comment", :string
  end

  create_table "sessions", :force => true do |t|
    t.column "session_id", :string
    t.column "data",       :text
    t.column "updated_at", :datetime
    t.column "created_at", :datetime
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "users", :force => true do |t|
    t.column "email",           :string
    t.column "name",            :string
    t.column "hashed_password", :string
    t.column "salt",            :string
    t.column "created_at",      :datetime
    t.column "updated_at",      :datetime
    t.column "email_confirmed", :boolean,  :default => false
  end

end
