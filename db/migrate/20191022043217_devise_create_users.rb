# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      ## Database authenticatable
      # カラム使用時(0:通常ユーザー登録時使用、1:ソーシャルユーザー登録時使用、2:両方で使用、3:ユーザー登録時使用しない)
      t.string :name                                            # カラム使用時(1)
      t.string :email,              null: false, default: ""    # カラム使用時(2)
      t.string :encrypted_password, null: false, default: ""    # カラム使用時(2)
      t.string :provider                                        # カラム使用時(2)
      t.string :uid                                             # カラム使用時(2)
      t.boolean :popupmessage_flg,               default: false # カラム使用時(3)
                                                                # (1の時は「本日中は非表示」、0の時は「継続表示」)
      t.references :team,           foreign_key: true           # カラム使用時(3)
      t.references :player,         foreign_key: true           # カラム使用時(3)

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at


      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    # add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true
  end
end
