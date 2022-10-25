class CandidatsController < ApplicationController

  def index
    @user = current_user
    @candidats = Candidat.all
  end

  def new
    @user = current_user
    @candidat = Candidat.new(nom: current_user.nom, prenom: current_user.prenom, email: current_user.email)
    if @user.recruteur.present?
      redirect_to root_path, alert: 'Vous avez déjà un profil recruteur'
    end
  end

  def create
    @candidat = Candidat.new(candidat_params)
    @candidat.user = current_user
    if @candidat.save
      redirect_to root_path, notice: 'Profil crée avec succès'
    else
      redirect_to new_candidat_path, alert: 'Une erreur est survenue lors de la création de votre profil'
    end
  end

  private

  def candidat_params
    params.require(:candidat).permit(:nom, :prenom, :email, :sexe, :telephone, :departement, :infos)

  end
end
