require 'rails_helper'

RSpec.feature 'ログイン後のテスト' do
  let!(:user) { create(:user) }
  let!(:other_user) { create(:user) }
  let!(:post_recipe) { FactoryBot.create(:post_recipe) }
  background do
    visit new_user_session_path
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_on 'ログイン'
  end

  feature 'トップ画面のテスト' do
    background do
      visit root_path
    end
    scenario 'BOOKMARKアイコンを押下する、ログイン画面に遷移する' do
      click_on 'BOOKMARK'
      expect(current_path).to eq user_path(user)
    end
    scenario 'POST RECIPEアイコンを押下し、ログイン画面に遷移する' do
      click_on 'POST RECIPE'
      expect(current_path).to eq new_post_recipe_path
    end
    scenario 'TOP20アイコンを押下し、有料会員登録を促す内容が表示される' do
      click_on 'TOP20'
      expect(current_path).to eq post_recipes_rankings_path
      expect(page).to have_content '有料会員の機能です'
    end
    scenario 'レシピ名を押下し、レシピ詳細ページに遷移する' do
      click_on post_recipe.title
      expect(current_path).to eq post_recipe_path(post_recipe)
    end
    scenario '会員名を押下し、会員詳細ページに遷移する' do
      click_on post_recipe.user.name
      expect(current_path).to eq user_path(post_recipe.user)
    end
    scenario 'VIEW MOREを押下し、新着一覧ページに遷移する' do
      click_on 'VIEW MORE'
      expect(current_path).to eq post_recipes_path
    end
  end

  feature 'プレミアムプラン加入のテスト' do
    scenario 'TOP20画面から、有料会員登録へのリンクを押下し、有料会員登録画面に遷移する' do
      visit post_recipes_rankings_path
      click_on 'こちら'
      expect(current_path).to eq premiums_payment_path
    end
    scenario 'プレミアム・プランの案内画面から、有料会員登録ボタンを押下すると、有料会員登録画面に遷移する' do
      visit premium_path
      click_on 'プレミアム・プランに加入する'
      expect(current_path).to eq premiums_payment_path
    end
    scenario 'クレジットカード登録ボタンを押下し、登録完了画面に遷移する' do
      visit premiums_payment_path
      click_on 'クレジットカード登録'
      expect(current_path).to eq premiums_complete_path
    end
  end

  feature 'レシピ詳細画面のテスト' do
    background do
      visit post_recipe_path(post_recipe)
    end
    scenario 'コメント欄が表示されている' do
      expect(page).to have_button '送信'
    end
    scenario 'レシピ投稿者＝ログイン会員の場合、レシピ編集ボタンが表示されている' do
      expect(page).to have_link 'レシピを編集', href: edit_post_recipe_path(post_recipe.user)
    end
    scenario 'レシピ投稿者≠ログイン会員の場合、レシピ編集ボタンが表示されない' do
      post_recipe.user = other_user
      expect(page).not_to have_link 'レシピを編集', href: edit_post_recipe_path(post_recipe.user)
    end
    scenario 'レシピ編集ボタンから、編集画面に遷移する' do
      click_on 'レシピを編集'
      expect(current_path).to eq edit_post_recipe_path(post_recipe)
    end
  end

  feature 'レシピ編集画面のテスト（公開済みレシピ）' do
    background do
      post_recipe.ingredients.create(name: '材料名', amount: '3')
      post_recipe.procedures.create(body: '作り方')
      visit edit_post_recipe_path(post_recipe)
      @old_title = post_recipe.title
    end
    scenario '編集内容が正しく更新される' do
      fill_in 'post_recipe[title]', with: '編集済のレシピ名'
      click_button 'レシピを更新'
      expect(page).to have_content 'レシピを更新しました！'
      expect(post_recipe.reload.title).not_to eq @old_title
    end
  end

  feature '会員詳細画面のテスト（マイページ）' do
    background do
      visit user_path(user)
    end
    scenario '投稿レシピが表示される' do
      expect(page).to have_content post_recipe.title
    end
    scenario 'いいねタブが表示される' do
      expect(page).to have_content 'いいね'
    end
    scenario '閲覧履歴タブが表示される' do
      expect(page).to have_content '閲覧履歴'
    end
     scenario 'フォローボタンが表示されない' do
      expect(page).to_not have_button 'フォローする'
    end
    scenario 'フォロー中タブが表示されない' do
      expect(page).to_not have_button 'フォロー中'
    end
    scenario '会員編集ボタンが表示される' do
      expect(page).to have_link nil, href: edit_user_path(user)
    end
    scenario '会員編集ボタンを押下し、会員編集画面に遷移する' do
      find('.fa-user-cog').click
      expect(current_path).to eq edit_user_path(user)
    end
  end

  feature '会員情報編集画面のテスト' do
    background do
      visit edit_user_path(user)
    end
    scenario '会員情報が正常に更新される' do
      fill_in 'user[introduction]', with: '編集済みの自己紹介'
      click_on '変更'
      expect(page).to have_content '編集済みの自己紹介'
    end
    scenario '必須項目が空欄の場合、更新されない' do
      fill_in 'user[name]', with: ''
      click_on '変更'
      expect(page).to have_content 'を登録してください'
    end
    scenario 'ゲスト会員は、退会するを押下するとトップ画面に遷移する' do
      click_on '退会する'
      expect(current_path).to eq root_path
      expect(page).to have_content 'ゲスト・アカウントでは退会できません'
    end
  end

  feature 'ログアウトのテスト' do
    scenario '正常にログアウトされる' do
      click_on 'LOG OUT'
      expect(page).to have_content 'ログアウトしました'
    end
  end
end