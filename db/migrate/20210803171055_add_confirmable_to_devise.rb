class AddConfirmableToDevise < ActiveRecord::Migration[6.1]
  # Note: You can't use change, as Student.update_all will fail in the down migration
  def up
    add_column :students, :confirmation_token, :string
    add_column :students, :confirmed_at, :datetime
    add_column :students, :confirmation_sent_at, :datetime
    add_column :students, :unconfirmed_email, :string # Only if using reconfirmable
    add_index :students, :confirmation_token, unique: true
    # Student.reset_column_information # Need for some types of updates, but not for update_all.
    # To avoid a short time window between running the migration and updating all existing
    # students as confirmed, do the following
    Student.update_all confirmed_at: DateTime.now
    # All existing user accounts should be able to log in after this.
  end

  def down
    remove_index :students, :confirmation_token
    remove_columns :students, :confirmation_token, :confirmed_at, :confirmation_sent_at
    remove_columns :students, :unconfirmed_email # Only if using reconfirmable
  end
end
