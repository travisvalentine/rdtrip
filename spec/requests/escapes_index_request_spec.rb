require 'spec_helper'

describe "Escapes index request" do
	let!(:escape) { FactoryGirl.create(:escape, :title => "Testing Specs", :expiration => Time.now.to_date + 7) }
	let!(:escape2) { FactoryGirl.create(:escape, :title => "Testing More", :expiration => Time.now.to_date + 7)  }

	let!(:escapes) { [escape, escape2] }

	before(:each) { login }

	context "when I am logged in" do

		it "it allows me to select from active escapes" do
      within("form#escape_selector") do
        page.should have_selector('select#escape_id')
      end
    end

    it "includes the escapes in the select box" do
      within("select#escape_id") do
        escapes.each do |e|
          page.should have_content(e.title)
        end
      end
    end

	end

end
