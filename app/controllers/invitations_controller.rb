class InvitationsController < ApplicationController
  def index
    @invitation = Invitation.new
  end
  
  def create
    invitation = Invitation.create(params[:invitation])
    if invitation.valid? 
      if invitation.save
        Mailer.invitation(invitation).deliver
        flash[:message] = "We'll be in touch!"
      end
    end
    redirect_to root_url
  end

  def show
    @invitation = Invitation.find_by_confirmation_token(params[:id])
    if @invitation.user.nil?
      user = @invitation.create_user(email: @invitation.email)
      if user.valid?
        user.save
      end
    end
    redirect_to root_url
  end
end
