require 'spec_helper'

describe Message do
  let!(:alice) { create(:user) }
  let!(:bob) { create(:user) }

  it 'should create one message per user' do
    expect { alice.messages.create }.to change { bob.messages.count }.by(1)
  end
end
