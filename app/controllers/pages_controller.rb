class PagesController < ApplicationController
  skip_before_action :authenticate_student!

  def index
  end
end
