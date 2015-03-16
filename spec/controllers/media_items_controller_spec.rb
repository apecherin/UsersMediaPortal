require 'spec_helper'
require 'rails_helper'

describe MediaItemsController do
  include Devise::TestHelpers
  include Warden::Test::Helpers
  describe "GET #index" do
    it "populates an array of media_items" do
      media_item = MediaItem.create(name: 'Big Image')
      get :index
      assigns(:media_items).should eq([media_item])
    end

    it "renders the :index view" do
      get :index
      response.should render_template :index
    end
  end
end