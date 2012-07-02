require 'spec_helper'

describe "Escapes show request" do

	let!(:escape) { FactoryGirl.create(:escape, :title => "Testing Specs",
                                              :expiration => (Time.now.to_date + 7),
                                              :nearest_metro => "Wookieland") }
  let!(:metro)  { FactoryGirl.create(:metro, :name => "Wookieland") }

  let!(:unique_song) { FactoryGirl.create(:unique_song, :metro_id => metro.id) }
  let!(:unique_song2) { FactoryGirl.create(:unique_song, :metro_id => metro.id) }
  let!(:unique_song3) { FactoryGirl.create(:unique_song, :metro_id => metro.id) }
  let!(:unique_song4) { FactoryGirl.create(:unique_song, :metro_id => metro.id) }

  let!(:unique_songs) { [unique_song, unique_song2, unique_song3, unique_song4] }

	context "when I am redirected from escapes index" do
    before(:each) do
      login
      visit escapes_path
      page.select("Testing Specs", :from => "escape_id")
      click_button("GO")
    end

    it "takes me to an escape for the category I select" do
      current_path.should have_content("Testing Specs")
    end

  end

  context "when I am logged in and looking at an escape" do
    before(:each) do
      login
      visit escape_path(escape)
    end

    it "shows information about the escape"  do
      page.should have_content(escape.title)
      page.should have_content(escape.location)
      page.should have_content(escape.city)
    end

    it "has a link to view the full details of the escape" do
      within("#escape_info") do
        page.should have_link("Full Details")
      end
    end

    it "shows the unique songs to the escape's nearest metropolitan area" do
      within(".unique") do
        page.should have_content(unique_song.artist)
        page.should have_content(unique_song.title)
      end
    end

    it "creates a playlist for the escape" do

    end

  end

end
