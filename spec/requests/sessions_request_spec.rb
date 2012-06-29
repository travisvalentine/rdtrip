require 'spec_helper'

describe "LinkedIn OAuth" do

  context "when logging in a user with LinkedIn" do
    
    it "logs in a user", :test => :login do
      login
      page.current_path.should == escapes_path
    end

    it "redirects to escapes#index" do
      pending
    end

  end

  context "when a user is logged in with LinkedIn" do

    it "won't allow you to go to the root url" do
      pending
    end

  end

end