require 'spec_helper'

describe User do
  let(:user){ FactoryGirl.create(:user) }

  describe "validations" do
    it "is valid" do
      user.should be_valid
    end
  end

  describe "associations" do
    it "has one lastfm token" do
      token = FactoryGirl.create(:lastfm_auth_token, :user_id => user.id)
      user.lastfm_auth_token.should == token
    end

    it "has one lastfm session key" do
      key = FactoryGirl.create(:lastfm_session_key, :user_id => user.id)
      user.lastfm_session_key.should == key
    end
  end
end