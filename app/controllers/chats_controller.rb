class ChatsController < ApplicationController
  def show
    @messages = []

    Message.each do |message|
      @messages << message
      message.touch :sent
    end
  end
end
