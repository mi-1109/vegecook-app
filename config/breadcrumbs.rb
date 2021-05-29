crumb :root do
  link "Home", root_path
end

# ========== 会員関連 ===========
crumb :user_show do |user|
  link "#{user.name}さんのページ", user_path(user)
  parent :root
end

crumb :user_edit do |user|
  link "プロフィール編集", edit_user_path(user)
  parent :user_show, user
end

# ========== レシピ関連 ===========
crumb :post_recipe_show do |post_recipe|
  link "#{post_recipe.title}", post_recipe_path(post_recipe)
  parent :root
end

crumb :post_recipe_edit do |post_recipe|
  link "レシピ編集", edit_post_recipe_path(post_recipe)
  parent :post_recipe_show, post_recipe
end

crumb :latest_recipes do
  link "新着レシピ", post_recipes_path
  parent :root
end

crumb :new_recipe do
  link "レシピ投稿", new_post_recipe_path
  parent :root
end

crumb :popular_recipes do
  link "TOP20", post_recipes_rankings_path
  parent :root
end

# ========== 有料会員関連 ===========
crumb :premium_info do
  link "プレミアム・プランのご案内", premiums_path
  parent :root
end

crumb :premium_payment do
  link "ご登録", premiums_payment_path
  parent :premium_info
end

crumb :premium_complete do
  link "登録完了", premiums_complete_path
  parent :premium_payment
end

# ========== 問い合わせ関連 ===========
crumb :select_inquiry do
  link "問い合わせ方法の選択", form_inquiries_path
  parent :root
end

crumb :form_inquiry do
  link "問い合わせフォーム", new_form_inquiry_path
  parent :select_inquiry
end

crumb :chat_inquiry do |chat|
  link "チャット問い合わせ", chats_path(chat)
  parent :select_inquiry
end
