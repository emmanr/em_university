class StudentsController < ApplicationController
  before_action :this_student, only: [:show, :destroy, :ban]

  def index
    @students = Student.all
  end

  def show
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
end
