class ChatsController < ApplicationController
  def show
    @messages = []

    current_user.messages.each do |message|
      @messages << message
      message.sent!
    end
  end
end
