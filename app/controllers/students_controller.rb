class StudentsController < ApplicationController
  before_action :this_student, except: [:index]
  before_action :only_admin, only: [:edit, :update]

  def index
    @students = Student.all
  end

  def show
  end

  def edit
  end

  def update
    @student.update(student_params)
    if @student.update(student_params)
      redirect_to @student, notice: "User was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @student.destroy
    redirect_to students_path, alert: "Successfully deleted student."
  end

  def ban
    @student.access_locked? ? @student.unlock_access! : @student.lock_access!
    flash[:warning] = "#{@student.email} account was updated!"
    redirect_to root_path
  end

  private

  def this_student
    @student = Student.find(params[:id])
  end

  private

  def student_params
    params.require(:student).permit(*Student::ROLES, :email, :first_name, :last_name)
  end

  def only_admin
    unless current_user.admin?
      redirect_to root_path, notice: "Not authorized!"
    end
  end
end
