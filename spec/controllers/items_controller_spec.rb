require 'rails_helper'
RSpec.describe ItemsController, type: :controller do
      describe "トップページが表示される" do
        before do
          get :top
        end
        it 'リクエストは200となる' do
          expect(response.status).to eq 200
        end
      end
      describe　"該当商品の詳細画面に遷移する" do
        before do
          get :show
        end
        it 'リクエストは200となる' do
          expect(response.status).to eq 200
        end
      end
end
