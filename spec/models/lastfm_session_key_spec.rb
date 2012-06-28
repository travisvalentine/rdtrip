require 'spec_helper'

describe LastfmSessionKey do
	require 'spec_helper'

  let!(:user)             { FactoryGirl.create(:user) }
  let!(:new_user)         { FactoryGirl.create(:user) }
  let!(:user_token)       { FactoryGirl.create(:lastfm_auth_token,
                                         :user_id => user.id) }
	let(:lastfm_auth_token) { FactoryGirl.build(:lastfm_session_key) }

  describe "validations" do
    it "is valid" do
      lastfm_auth_token.should be_valid
    end
  end

  describe "associations" do

    it "belongs to a user" do
      user.lastfm_auth_token.token.should == user_token.token
    end

	end

end
