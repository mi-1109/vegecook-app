require 'rails_helper'

RSpec.feature '新規会員登録のテスト' do
  let!(:user) { FactoryBot.build(:user) }

  feature '新規会員登録成功のテスト' do
    background do
      visit new_user_registration_path
      fill_in 'user[name]', with: user.name
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      fill_in 'user[password_confirmation]', with: user.password_confirmation
    end
    scenario '新規会員登録成功のテスト' do
      expect { click_button '会員登録' }.to change(User.all, :count).by(1)
    end
    scenario '新規会員登録後、トップ画面にリダイレクトする' do
      click_button '会員登録'
      expect(current_path).to eq root_path
      expect(page).to have_content 'Welcome'
    end
  end

  feature '新規会員登録失敗のテスト' do
    background do
      visit new_user_registration_path
      fill_in 'user[name]', with: user.name
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
    end
    scenario '新規会員登録に失敗する' do
      expect { click_button '会員登録' }.to change(User.all, :count).by(0)
    end
    scenario 'バリデーションエラーが表示される' do
      click_button '会員登録'
      expect(page).to have_content 'パスワードの入力が一致していません'
    end
  end
end