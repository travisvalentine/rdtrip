require 'spec_helper'

describe EscapesController do

  describe "#index" do
    it "returns an array of all escapes" do
      escape = Factory(:escape)
      get :index
      assigns(:escapes).should eq([escape])
    end

    it "renders the :index view" do
      pending
      # get :index
      # response.should render_template :index
    end

  end

end