class MessagesController < ApplicationController
  layout false

  def index
    @messages = []

    current_user.messages.where(sent: nil).each do |message|
      @messages << message
      message.touch :sent
    end
  end

  def create
    current_user.messages.create(params[:message])
    head status: 200
  end
end
