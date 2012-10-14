require 'spec_helper'

describe MessagesController do
  describe "GET index" do
    before do
      Message.destroy_all

      3.times do |i|
        FactoryGirl.create(:message, created_at: (3 - i).minutes.ago)
      end
    end

    it "assigns all messages to @messages" do
      get :index
      assigns(:messages).should have(3).items
    end

    it "assigns all messages to @messages" do
      get :index
      get :index
      assigns(:messages).should have(0).items
    end
  end
end
