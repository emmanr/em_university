class AddTrackableToDevise < ActiveRecord::Migration[6.1]
  def up
    add_column :students, :sign_in_count, :integer, default: 0, null: false
    add_column :students, :current_sign_in_at, :datetime
    add_column :students, :last_sign_in_at, :datetime
    add_column :students, :current_sign_in_ip, :inet
    add_column :students, :last_sign_in_ip, :inet
  end

  def down
    remove_columns :students, :sign_in_count, :current_sign_in_at, :last_sign_in_at, :current_sign_in_ip, :last_sign_in_ip
  end
end
