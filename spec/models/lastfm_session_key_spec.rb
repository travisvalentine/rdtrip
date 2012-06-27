require 'spec_helper'

describe LastfmSessionKey do
	require 'spec_helper'

	let(:lastfm_auth_token) { FactoryGirl.build(:lastfm_session_key) }

  describe "validations" do
    it "is valid" do
      lastfm_auth_token.should be_valid
    end
  end

  describe "associations" do
  	let(:user)				{ FactoryGirl.create(:user) }
		let(:user_token)	{ FactoryGirl.create(:lastfm_auth_token, :user_id => user.id) }

    it "belongs to a user" do
      user.lastfm_auth_token.should == user_token
    end

	end

end
