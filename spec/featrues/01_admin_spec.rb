require 'rails_helper'

RSpec.feature 'ログイン前のテスト' do
  let!(:admin) { create(:admin) }
  let!(:user) { create(:user) }
  let!(:post_recipe) { FactoryBot.create(:post_recipe) }
  background do
    visit new_admin_session_path
    fill_in 'admin[email]', with: admin.email
    fill_in 'admin[password]', with: admin.password
    click_on 'ログイン'
  end

  feature 'レシピ画面のテスト' do
    background do
      visit admin_post_recipes_path
    end
    scenario '有効会員の公開レシピのステータスが正常に表示される' do
      expect(page).to have_content '公開'
    end
    scenario 'レシピ詳細画面が正常に表示される' do
      click_on post_recipe.title
      expect(current_path).to eq admin_post_recipe_path(post_recipe)
    end
    scenario 'レシピ削除が正常に表示される' do
      click_on post_recipe.title
      click_on 'レシピを削除'
      expect(current_path).to eq admin_post_recipes_path
    end
  end

  feature '会員画面のテスト' do
    background do
      visit admin_users_path
    end
    scenario '有効会員の会員ステータスが正常に表示される' do
      expect(page).to have_content '有効'
    end
    scenario '有効会員のプラン・ステータスが正常に表示される' do
      expect(page).to have_content 'スタンダード'
    end
    scenario '会員詳細画面が正常に表示される' do
      click_on user.name
      expect(current_path).to eq admin_user_path(user)
    end
  end
end