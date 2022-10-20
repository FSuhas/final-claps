class JobsController < ApplicationController
  def new
    @user = current_user
    @job = Job.new
  end
end
