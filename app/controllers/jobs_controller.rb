class JobsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @news = Newsletter.new

    if user_signed_in?
      @user = current_user
    else
      @user = User.new
    end

    if params[:query].present?
      @jobs = Job.search_by_query(params[:query])
      @jobs = @jobs.where("date >= ?", Time.now).order(date: :asc)
    else
      @jobs = Job.all
      @jobs = @jobs.where("date >= ?", Time.now).order(date: :asc)
    end
  end

  def new
    @user = current_user
    @job = Job.new
  end
end
