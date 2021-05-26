require 'rails_helper'

RSpec.describe Comment, type: :model do
  let!(:user) { create(:user) }
  let!(:post_recipe) { FactoryBot.create(:post_recipe) }

  describe 'コメントのバリデーション・テスト' do
    it "35文字以内の場合、コメント投稿に成功する" do
      comment = Comment.new(comment: Faker::Lorem.characters(number: 35))
      comment.post_recipe_id = post_recipe.id
      comment.user_id = post_recipe.user.id
      expect(comment).to be_valid
    end
    it "36文字以上の場合、コメント投稿に失敗する" do
      comment = Comment.new(comment: Faker::Lorem.characters(number: 36))
      comment.post_recipe_id = post_recipe.id
      comment.user_id = post_recipe.user.id
      expect(comment).not_to be_valid
    end
    it "空欄場合、コメント投稿に失敗する" do
      comment = Comment.new(comment: Faker::Lorem.characters(number: 0))
      expect(comment).not_to be_valid
    end
  end
end
