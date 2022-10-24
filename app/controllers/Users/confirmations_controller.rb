# frozen_string_literal: true

class Users::ConfirmationsController < Devise::ConfirmationsController
  # GET /resource/confirmation/new
  # def new
  #   super
  # end

  # POST /resource/confirmation
  def create
    @user = User.find_by(email: params[:user][:email])
    if @user
      EmailMailer.with(user: @user).confirmation_mail(@user).deliver_now
      # mail(to: @user.email, subject: 'Confirmation email')
      redirect_to root_path, notice: "Confirmez votre email"
    else
      redirect_to new_user_confirmation_path, alert: "Aucun utilisateur trouvé"
    end
  end

  # GET /resource/confirmation?confirmation_token=abcdef
  # def show
  #   super
  # end

  # protected

  # The path used after resending confirmation instructions.
  # def after_resending_confirmation_instructions_path_for(resource_name)
  #   super(resource_name)
  # end

  # The path used after confirmation.
  # def after_confirmation_path_for(resource_name, resource)
  #   super(resource_name, resource)
  # end
end
