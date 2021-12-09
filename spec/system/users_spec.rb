require 'rails_helper'

RSpec.describe "ユーザー新規登録", type: :system do
  before do
    @user = FactoryBot.build(:user)
  end
  context 'ユーザー新規登録ができるとき' do
    it '正しい情報を入力すれば、ユーザの新規登録ができてトップページに移動する' do
      # トップページに移動する
      visit root_path

      #トップページに新規登録へ遷移するリンク（文字）があることを確認する
      expect(page).to have_content('新規登録')

      #新規登録ページへ移動
      visit new_user_registration_path

      #ユーザ情報を入力
      fill_in 'user_name', with: @user.nickname
      fill_in 'user_email', with: @user.email
      fill_in 'user_password', with: @user.password
      fill_in 'user_password_confirmation', with: @user.password_confirmation

      #登録ボタンを押下でユーザモデルのカウントが１上がることを確認(レコード)
      expect{
        find('input.sign_up').click
      }.to change {User.count}.by(1)

      #トップページへ遷移を確認
      expect(current_path).to eq(root_path)

      #ログアウトボタンが表示されていることを確認
      expect(page).to have_content('ログアウト')

      #サインアップ、ログインへ遷移するボタンが表示されていないことを確認
      expect(page).to have_no_content('新規登録')
      expect(page).to have_no_content('ログイン')
    end

  end

  context 'ユーザー新規登録ができるとき' do
    it '謝った情報では新規登録ができず、新規登録ページに戻る' do
      #トップページに遷移
      #visit root_path

      #トップページに新規登録へ遷移するリンクがあることを確認する
      #expect(page).to have_content('新規登録')

      #新規登録ページへ移動
      #visit new_user_registration_path

      #ユーザ情報を入力


      #登録ボタンを押下してもユーザモデルのカウントは上がらないことを確認

      #新規登録ページへ戻されることを確認

    end
  end

end
