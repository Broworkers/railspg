class MessagesController < ApplicationController
  layout false

  def index
    @messages = []

    Message.where(sent: nil).each do |message|
      @messages << message
      message.touch :sent
    end
  end
end
