class ChatsController < ApplicationController
  def show
    @messages = []

    current_user.messages.each do |message|
      @messages << message
      message.touch :sent
    end
  end
end
