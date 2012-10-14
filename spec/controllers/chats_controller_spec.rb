require 'spec_helper'

describe ChatsController do
  before(:all) { Message.destroy_all }
  describe "GET show" do
    let(:user) { create(:user) }
    let!(:message) { create(:message, user: user) }

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
