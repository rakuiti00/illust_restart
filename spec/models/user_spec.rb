require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do

    context 'ユーザーが新規登録できる場合' do
      it '全ての情報が正しい場合、登録できること' do
        expect(@user).to be_valid
      end
      it 'twitter_url、pixiv_url、another_urlは空でも登録できること' do
        @user.twitter_url = ''
        @user.pixiv_url = ''
        @user.another_url = ''
        expect(@user).to be_valid
      end
    end

    context 'ユーザーが新規登録できない場合' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "ニックネームを入力してください"
      end

      it 'emailが空では登録できない' do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end

      it '重複したemailが存在する場合登録できない' do
        @user.save
        @user2 = FactoryBot.build(:user)
        @user2.email = @user.email
        @user2.valid?
        expect(@user2.errors.full_messages).to include("Eメールはすでに存在します")
      end

      it '＠が含まれていないと登録できない' do
        @user.email = "test1com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールは不正な値です")
      end

      it 'passwordが空では登録できない' do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end

      it 'passwordが5文字以下では登録できない' do
        @user.password = "pas01"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end

      it 'passwordが全角英数字のみでは登録できない' do
        @user.password = "PAS００１"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは半角英数字と数字を混合してください")
      end

      it 'passwordが半角英字のみでは登録できない' do
        @user.password = "testtest"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは半角英数字と数字を混合してください")
      end

      it 'passwordが半角数字のみでは登録できない' do
        @user.password = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは半角英数字と数字を混合してください")
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = "111111"
        @user.password_confirmation = "222222"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end

      it 'twitter_urlはURL以外では登録できない' do
        @user.twitter_url = "htt://www.twitter.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Twitter urlはURLを入力してください")
      end

      it 'pixiv_urlはURL以外では登録できない' do
        @user.pixiv_url = "attp://www.pixiv.co.jp"
        @user.valid?
        expect(@user.errors.full_messages).to include("Pixiv urlはURLを入力してください")
      end

      it 'another_urlはURL以外では登録できない' do
        @user.another_url = "http//www.another.co.jp"
        @user.valid?
        expect(@user.errors.full_messages).to include("Another urlはURLを入力してください")
      end

    end

  end
end
