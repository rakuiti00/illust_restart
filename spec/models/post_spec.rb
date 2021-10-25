require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post= FactoryBot.build(:post)
  end

  describe '投稿情報の保存' do

    context '投稿情報が保存できる場合' do
      it '登録する全ての情報が正しい場合、保存できる' do
        expect(@post).to be_valid
      end
    end

    context '投稿情報が保存できない場合' do
      it 'タイトルが空では登録できない' do
        @post.title = ""
        @post.valid?
        expect(@post.errors.full_messages).to include("タイトルを入力してください")
      end

      it 'イラスト画像が空では登録できない' do
        @post.image = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("画像を入力してください")
      end

      it 'ユーザーIDが紐づいていないと登録できない' do
        @post.user = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("Userを入力してください")
      end

      it 'トレーニングIDが紐づいていないと登録できない' do
        @post.traning = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("Traningを入力してください")
      end      
    end
  end

  


end
