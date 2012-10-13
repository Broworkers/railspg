require 'spec_helper'

describe MessagesController do
  describe "GET index" do
    before(:all) do
      3.times do |i|
        FactoryGirl.create(:message, created_at: (3 - i).minutes.ago)
      end
    end

    it "assigns all messages to @messages" do

      get :index
      assigns(:messages).should have(3).items
    end

    it "assigns all messages to @messages" do

      get :index, updated_at: 150.seconds.ago
      assigns(:messages).should have(2).items
    end
  end
end
