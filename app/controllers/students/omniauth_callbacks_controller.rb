class Students::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    handle_auth "Google"
  end

  def github
    handle_auth "Github"
  end

  def handle_auth(kind)
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @student = Student.from_omniauth(request.env['omniauth.auth'])

    if @student.persisted?
      flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: kind
      sign_in_and_redirect @student, event: :authentication
    else
      session['devise.google_data'] = request.env['omniauth.auth'].except('extra') # Removing extra as it can overflow some session stores
      redirect_to new_student_registration_url, alert: @student.errors.full_messages.join("\n")
    end
  end
end
