require 'spec_helper'

describe InfoController do

  describe "GET 'shoutouts'" do
    it "returns http success" do
      get 'shoutouts'
      response.should be_success
    end
  end

end
