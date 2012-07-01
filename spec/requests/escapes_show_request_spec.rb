require 'spec_helper'

describe "Escapes show request" do

	let!(:escape) { FactoryGirl.create(:escape, :title => "Testing Specs", :expiration => Time.now.to_date + 7) }

	before(:each) do
		login
		visit escape_path
	end

	context "when I am logged in" do
    it "takes me to an escape for the category I select" do
      page.select("Testing Specs", :from => "escape_id")
      click_button "GO"
      current_path.should have_content("Testing Specs")
    end
  end

end
