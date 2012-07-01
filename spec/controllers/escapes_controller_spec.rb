require 'spec_helper'

describe EscapesController do

  let!(:escape) { FactoryGirl.create(:escape) }

  describe "#index" do

    it "renders the :index view" do
      get :index
      response.should render_template :index
    end

  end

end