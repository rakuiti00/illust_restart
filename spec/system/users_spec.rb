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

      #登録した名前が表示されていることを確認
      expect(page).to have_content(@user.nickname)

      #ログアウトボタンが表示されていることを確認
      expect(page).to have_content('ログアウト')

      #サインアップ、ログインへ遷移するボタンが表示されていないことを確認
      expect(page).to have_no_content('新規登録')
      expect(page).to have_no_content('ログイン')
    end

  end

  context 'ユーザー新規登録ができないとき' do
    it '謝った情報では新規登録ができず、新規登録ページに戻る' do
      #トップページに遷移
      visit root_path

      #トップページに新規登録へ遷移するリンクがあることを確認する
      expect(page).to have_content('新規登録')

      #新規登録ページへ移動
      visit new_user_registration_path

      #ユーザ情報を入力
      fill_in 'user_name', with: ''
      fill_in 'user_email', with: ''
      fill_in 'user_password', with: ''
      fill_in 'user_password_confirmation', with: ''

      #登録ボタンを押下してもユーザモデルのカウントは上がらないことを確認
      expect{
        find('input.sign_up').click
      }.to change {User.count}.by(0)

      #新規登録ページへ戻されることを確認
      expect(current_path).to eq user_registration_path

      #エラーメッセージの表示を確認
      expect(page).to have_content('エラー')
    end
  end
end

RSpec.describe "ログイン", type: :system do
    before do
      @user = FactoryBot.create(:user)
    end

    context 'ログインができるとき' do
      it '保存されているユーザの情報と合致すればログインができる' do
        #トップページに遷移する
        visit root_path

        #ログインのリンクが存在することを確認する
        expect(page).to have_content('ログイン')
        
        #ログイン画面に遷移する
        visit new_user_session_path

        #ログイン情報を入力する
        fill_in 'user_email', with: @user.email
        fill_in 'user_password', with: @user.password

        #ログインボタンを押下する
        find('input[name="commit"]').click

        #トップページに遷移する
        expect(current_path).to eq(root_path)

        #新規登録リンク・ログインリンク等がないことを確認する
        expect(page).to have_no_content('新規登録')
        expect(page).to have_no_content('ログイン')

        #ログアウトリンクがあることを確認する
        expect(page).to have_content('ログアウト')

        #ログインユーザ名が表示されていることを確認する
        expect(page).to have_content(@user.nickname)

      end
    end

    context 'ログインができないとき' do
      it '保存されているユーザの情報と合致しない場合、ログインできない' do
        #トップページに遷移する
        visit root_path

        #ログインのリンクが存在することを確認する
        expect(page).to have_content('ログイン')


        #ログイン画面に遷移する
        visit new_user_session_path

        #DBに保存されていない情報を入力する(空文字)
        fill_in 'user_email', with: ''
        fill_in 'user_password', with: ''

        #ログインボタンを押下する
        find('input[name="commit"]').click

        #ログイン画面に戻されることを確認する
        expect(current_path).to eq(new_user_session_path)
    
      end
    end


end

