class MessagesController < ApplicationController
  layout false

  def index
    @messages = Message.all
  end
end
