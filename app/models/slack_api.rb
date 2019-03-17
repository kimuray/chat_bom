class SlackApi
  def initialize
    @client = Slack::Web::Client.new
  end

  def channels
    @client.channels_list.channels
  end

  def post_message(channel:, text:, as_user: true)
    @client.chat_postMessage(channel: channel, text: text, as_user: as_user)
  end
end