class InvitesController < ApplicationController
  

  def new
    @event = Event.find(params[:id])
    @invite = @event.invites.build
  end

  def create
    @event = Event.find(params[:id])
    @invite = @event.invites.build(invite_params)
    @invite.save

    redirect_to @event
  end

  def edit
    @invite = Invite.find(params[:id])
  end

  def show
     @invite = Invite.find(params[:id])
  end

  def update
    @invite = Invite.find(params[:id])
    @invite.update(invite_params)

    redirect_to @invite.event
  end

  private
    def invite_params
      params.require(:invite).permit(:guest_name, :status)
    end

end