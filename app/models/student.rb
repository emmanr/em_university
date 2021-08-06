class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :timeoutable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable, :trackable,
         :timeoutable, :lockable,
         :omniauthable, omniauth_providers: [:google_oauth2, :github]

  def timeout_in
    # return 1.year if admin?
    1.days
  end

  def self.from_omniauth(access_token)
    data = access_token.info
    student = Student.where(email: data['email']).first

    unless student
      student = Student.create(
        first_name: data['first_name'],
        last_name: data['last_name'],
        email: data['email'],
        password: Devise.friendly_token[0,20]
      )
      student.skip_confirmation!
    end
    student
  end
end
