class AddLockableToDevise < ActiveRecord::Migration[6.1]
  def change
    add_column :students, :failed_attempts, :integer, default: 0, null: false # Only if lock strategy is :failed_attempts
    add_column :students, :locked_at, :datetime

    # Add these only if unlock strategy is :email or :both
    add_column :students, :unlock_token, :string
    add_index :students, :unlock_token, unique: true
  end
end
