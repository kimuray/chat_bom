class MessagesController < ApplicationController
  before_action :set_slack_client

  def new
    @channels = @client.channels
  end

  def create
    channel_ids_hash.each do |_, channel_id|
      @client.post_message(channel: channel_id, text: message, as_user: true)
    end
    redirect_to new_message_url, notice: "Success post messages"
  end

  private
  
  def set_slack_client
    @client = SlackApi.new
  end

  def message_params
    params.permit(:message, channel_ids: [])
  end

  def channel_ids_hash
    params[:channel_ids]
  end

  def message
    params[:message]
  end
end
