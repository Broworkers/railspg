require 'spec_helper'

describe ChatsController do
  describe "GET show" do
    let!(:message) { create(:message) }
    after { Message.destroy_all }

    it "assigns all messages to @messages" do
      get :show
      assigns(:messages).should have(1).items
    end

    it "marks all messages with sent" do
      get :show
      expect(message.reload).to be_sent
    end
  end
end
