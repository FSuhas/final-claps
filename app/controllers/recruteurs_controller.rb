class RecruteursController < ApplicationController
  def new
    @user = current_user
    @recruteur = Recruteur.new(nom: current_user.nom, prenom: current_user.prenom, email: current_user.email)
    if @user.candidat.present?
      redirect_to root_path, alert: 'Vous avez déjà un profil candidat'
    end
  end

  def create
    @recruteur = Recruteur.new(recruteur_params)
    @recruteur.user = current_user
    if @recruteur.save
      redirect_to root_path, notice: 'Profil crée avec succès'
    else
      redirect_to new_recruteur_path, alert: 'Une erreur est survenue lors de la création de votre profil'
    end
  end

  private

  def recruteur_params
    params.require(:recruteur).permit(:nom, :prenom, :email, :telephone, :job)
  end
end
