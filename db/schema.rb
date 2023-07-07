# frozen_string_literal: true

ActiveRecord::Schema[7.0].define(version: 20_230_707_030_637) do
  create_table 'accounts', charset: 'utf8mb4', collation: 'utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.string 'phone', default: ''
    t.string 'avatar', default: ''
    t.integer 'role', default: 0, null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['email'], name: 'index_accounts_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_accounts_on_reset_password_token', unique: true
  end
end
