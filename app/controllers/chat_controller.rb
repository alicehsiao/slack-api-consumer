class ChatController < ApplicationController
  def index
    @channels = SlackApiWrapper.list_channels
  end

  def new
    @channel = params[:channel]
  end

  def create
    if SlackApiWrapper.send_msg(params["channel"], channel_params["message"])
      flash[:status] = :success
      flash[:message] = "Posted to Slack!"
      redirect_to root_path
    else
      flash[:status] = :warning
      flash[:message] = "Unable to Post to Slack"
      render :new, status: :bad_request
    end
  end

  private
  def channel_params
    params.permit(:message)
  end
end
