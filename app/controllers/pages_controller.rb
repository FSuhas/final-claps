class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :role]
  def home
    if params[:query].present?
      @jobs = Job.search_by_query(params[:query])
      @jobs = @jobs.where("date >= ?", Time.now).order(date: :asc)
    else
      @jobs = Job.all
      @jobs = @jobs.where("date >= ?", Time.now).order(date: :asc)
    end
  end
  def role

  end
end
