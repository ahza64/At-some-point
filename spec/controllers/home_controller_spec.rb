require 'rails_helper'

RSpec.describe HomeController, type: :controller do
   describe "#index" do
      it "should render the index" do
         get :index
         expect(response).to render_template(:index)
      end
   end

end
