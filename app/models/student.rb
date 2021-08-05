class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable, :trackable,
         :timeoutable, :lockable

  def timeout_in
    # return 1.year if admin?
    1.days
  end
end
