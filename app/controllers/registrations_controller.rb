class RegistrationsController < Devise::RegistrationsController

  def new
    super
  end
  def create
    # super
    @user = User.new(permitted_user)
    @user.roles << Role.where(name: "normal").first
    if @user.save(validate: false)
      respond_to do |format|
        format.html{ sign_in_and_redirect @user}
      end
    else
      @errors=@user.errors
      respond_to do |format|
        format.html {render "/devise/registrations/new"}
      end
    end
  end
  protected
  def permitted_user
    params.require(:user).permit(:email,:activation_token,:name,:gender,:password,:password_confirmation)
  end
end