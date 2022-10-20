class NewslettersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create]
  def create
    @news = Newsletter.new(news_params)
    if @news.save
      redirect_to root_path, notice: "Merci pour votre inscription"
    else
      redirect_to root_path, alert: "Votre email n'est pas valide ou est déjà inscrit"
    end
  end

  private

  def news_params
    params.require(:newsletter).permit(:email)
  end
end
