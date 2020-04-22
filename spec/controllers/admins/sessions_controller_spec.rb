require 'rails_helper'
RSpec.describe Admins::SessionsController, type: :controller do

	describe 'ログイン画面' do
    let(:admins) { create(:admins) }
    before do
      visit new_admin_session_path
    end
      context "メールアドレス・パスワードでログインする" do
        it '管理者トップ画面が表示される' do
          let(:test_admins) { admins }
          fill_in 'admins[name]', with: test_admins.name
          fill_in 'admins[password]', with: test_admins.password
          click_button 'ログイン'

          expect(current_path).to eq (admins_top_path)
        end
      end
    end

    describe '管理者トップ画面' do
      before do
        visit admins_top_path
      end
      context "ヘッダからジャンル一覧へのリンクを押下する" do
        it 'ジャンル一覧画面が表示される' do
          expect(current_path).to eq (admins_genres_path)
        end
      end
      context "ヘッダから会員一覧画面へのリンクを押下する" do
        it '会員一覧画面が表示される' do
          expect(current_path).to eq (admins_customers_path)
        end
      end
    end
end