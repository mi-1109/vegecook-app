require 'rails_helper'

RSpec.feature 'ログイン前のテスト' do
  let!(:user) { create(:user) }
  let!(:post_recipe) { FactoryBot.create(:post_recipe) }

  feature 'トップ画面のテスト' do
    background do
      visit root_path
    end
    scenario 'BOOKMARKアイコンを押下する、ログイン画面に遷移する' do
      click_on 'BOOKMARK'
      expect(current_path).to eq new_user_session_path
    end
    scenario 'POST RECIPEアイコンを押下し、ログイン画面に遷移する' do
      click_on 'POST RECIPE'
      expect(current_path).to eq new_user_session_path
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

  feature 'プレミアムプランへの加入の制御テスト' do
    scenario 'TOP20画面から、有料会員登録へのリンクを押下し、ログイン画面に遷移する' do
      visit post_recipes_rankings_path
      click_on 'こちら'
      expect(current_path).to eq new_user_session_path
      expect(page).to have_content '無料会員登録の上、プレミアム・プラン加入手続きにお進みください'
    end
    scenario 'プレミアム・プランの案内画面から、有料会員登録ボタンを押下すると、ログイン画面に遷移する' do
      visit premium_path
      click_on 'プレミアム・プランに加入する'
      expect(current_path).to eq new_user_session_path
      expect(page).to have_content '無料会員登録の上、プレミアム・プラン加入手続きにお進みください'
    end
  end

  feature 'レシピ詳細画面のテスト' do
    background do
      visit post_recipe_path(post_recipe)
    end
    scenario '会員名を押下する' do
      click_on post_recipe.user.name
      expect(current_path).to eq user_path(post_recipe.user)
    end
    scenario 'レシピ編集ボタンが表示されていない' do
      expect(page).to_not have_link nil, href: edit_post_recipe_path(post_recipe)
    end
    scenario 'レシピ編集画面に直接URLからアクセスした場合、ログイン画面に遷移する' do
      visit edit_post_recipe_path(post_recipe)
      expect(current_path).to eq new_user_session_path
      expect(page).to have_content 'アカウント登録もしくはログインしてください。'
    end
  end

  feature '会員詳細画面のテスト' do
    background do
      visit user_path(post_recipe.user.id)
    end
    scenario '遷移先の会員の投稿レシピタブが表示される' do
      expect(page).to have_content '投稿レシピ'
    end
    scenario '遷移先の会員の投稿レシピタブが表示される' do
      expect(page).to have_content 'いいね'
    end
    scenario '遷移先の会員の投稿レシピタブが表示される' do
      expect(page).to_not have_content '閲覧履歴'
    end
    scenario '遷移先の会員の投稿レシピタブが表示される' do
      expect(page).to_not have_button 'フォローする'
    end
    scenario '遷移先の会員の投稿レシピタブが表示される' do
      expect(page).to_not have_button 'フォロー中'
    end
    scenario '会員編集ボタンが表示されていない' do
      expect(page).to_not have_link nil, href: edit_user_path(post_recipe.user)
    end
    scenario '会員編集画面に直接URLからアクセスした場合、ログイン画面に遷移する' do
      visit edit_user_path(post_recipe.user)
      expect(current_path).to eq new_user_session_path
      expect(page).to have_content 'アカウント登録もしくはログインしてください。'
    end
  end

  feature 'ヘッダーのテスト' do
    background do
      visit post_recipes_path
    end
    scenario 'ロゴを押下し、トップ画面に遷移する' do
      click_on 'VegeCook'
      expect(current_path).to eq root_path
    end
    scenario 'SIGN UPを押下し、会員登録画面に遷移する' do
      click_on 'SIGN UP'
      expect(current_path).to eq new_user_registration_path
    end
    scenario 'LOG INを押下し、ログイン画面に遷移する' do
      click_on 'LOG IN'
      expect(current_path).to eq new_user_session_path
    end
    scenario 'ABOUTから「はじめての方」画面に遷移する' do
      click_on 'ABOUT'
      click_on 'はじめての方'
      expect(current_path).to eq about_path
    end
    scenario 'ABOUTから「プレミアム・プランのご案内」画面に遷移する' do
      click_on 'ABOUT'
      click_on 'プレミアム・プランのご案内'
      expect(current_path).to eq premium_path
    end
    scenario 'ABOUTから「お問い合わせ」画面に遷移する' do
      click_on 'ABOUT'
      click_on 'お問い合わせ'
      expect(current_path).to eq form_inquiries_path
    end
  end

  feature '問い合わせのテスト' do
    background do
      visit form_inquiries_path
    end
    scenario 'フォームで問い合わせるを押下し、ログイン画面画面に遷移する' do
      click_on 'フォームで問い合わせる'
      expect(current_path).to eq new_user_session_path
      expect(page).to have_content 'アカウント登録もしくはログインしてください。'
    end
    scenario 'チャットで問い合わせるを押下し、ログイン画面画面に遷移する' do
      click_on 'チャットで問い合わせる'
      expect(current_path).to eq new_user_session_path
      expect(page).to have_content 'アカウント登録もしくはログインしてください。'
    end
  end

  feature '検索のテスト' do
    background do
      visit root_path
      fill_in 'レシピ検索', with: post_recipe.title
      click_on 'GO'
    end
    scenario '検索ワードを入力し、GOを押下すると、検索結果が新着順で表示される' do
      expect(current_path).to eq post_recipes_searches_path
      expect(page).to have_content post_recipe.title
    end
    scenario '人気順を押下すると、有料会員の案内が表示される' do
      click_on '人気順'
      expect(page).to have_content '有料会員の機能'
    end
  end

  feature '会員ログインのテスト' do
    before do
      visit new_user_session_path
    end
    scenario 'ログイン成功のテスト' do
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      click_on 'ログイン'
      expect(current_path).to eq root_path
      expect(page).to have_content 'ログインしました'
    end
    scenario 'ログイン失敗のテスト' do
      fill_in 'user[email]', with: Faker::Internet.email
      fill_in 'user[password]', with: user.password
      click_on 'ログイン'
      expect(page).to have_content 'メールアドレス もしくはパスワードが間違っています'
    end
  end
end
