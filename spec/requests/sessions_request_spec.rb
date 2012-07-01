require 'spec_helper'

describe "LinkedIn OAuth" do

  before(:each) { login }

  context "when logging in a user with LinkedIn" do

    it "logs in a user and redirects to escapes#index" do
      page.current_path.should == escapes_path
    end

  end

  context "when a user is logged in with LinkedIn" do

    it "won't allow you to go to the root url" do
      visit "/"
      page.current_path.should == escapes_path
    end

  end

  context "when logging out" do

    it "the session is cleared and the page redirects to root" do
      within("header") do
        click_link_or_button "Log out"
      end
      page.current_path.should == "/"
    end

  end

end