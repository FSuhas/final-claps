class JobsController < ApplicationController
  def index
    if params[:query].present?
      @jobs = Job.search_by_query(params[:query]).order(date: :asc)
      @jobs = @jobs.where("date >= ?", Time.now)
    else
      @jobs = Job.all.order(date: :asc)
      @jobs = @jobs.where("date >= ?", Time.now)
    end
  end
end
