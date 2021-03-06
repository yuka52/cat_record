require 'rails_helper'

RSpec.describe "ユーザー新規登録", type: :system do
  before do
    @user = FactoryBot.build(:user)
  end

  it '正しい情報を入力すればユーザー新規登録ができてトップページに移動する' do
    # 新規登録ページへ移動する
    visit new_user_registration_path

    # ユーザー情報を入力する
    fill_in 'user_email', with: @user.email
    fill_in 'user_password', with: @user.password
    fill_in 'user_password_confirmation', with: @user.password_confirmation
    
    # サインアップボタンを押すとユーザーモデルのカウントが1上がることを確認する
    expect{
      find('input[name="commit"]').click
    }.to change { User.count }.by(1)
    
    # トップページへ遷移したことを確認する
    expect(current_path).to eq(root_path)
    
    # カーソルを合わせるとログアウトボタンが表示されることを確認する
    expect(page).to have_content('ログアウト')
    
    # サインアップページへ遷移するボタンや、ログインページへ遷移するボタンが表示されていないことを確認する
    expect(page).to have_no_content('新規登録はこちら')
    expect(page).to have_no_content('ログインする')
  end

  it '誤った情報ではユーザー新規登録ができずに新規登録ページへ戻ってくる' do
    # 新規登録ページへ移動する
    visit new_user_registration_path

    # ユーザー情報を入力する
    fill_in 'user_email', with: ''
    fill_in 'user_password', with: ''
    fill_in 'user_password_confirmation', with: ''

    # サインアップボタンを押してもユーザーモデルのカウントは上がらないことを確認する
    expect{
      find('input[name="commit"]').click
    }.to change { User.count }.by(0)
    # 新規登録ページへ戻されることを確認する
    expect(current_path).to eq('/users')
  end
end

RSpec.describe 'ユーザーログイン', type: :system do
  before do
    @user = FactoryBot.create(:user)
  end
  context 'ログインができるとき' do
    it '保存されているユーザーの情報と合致すればログインができる' do
      # ログインページへ移動する
      visit new_user_session_path

      # 正しいユーザー情報を
      fill_in 'session_email', with: @user.email
      fill_in 'session_password', with: @user.password

      # ログインボタンを押す
      click_on('ログインする')

      # トップページへ遷移することを確認する
      expect(current_path).to eq(root_path)

      # トップページにログアウトボタンが表示されることを確認する
      expect(page).to have_content('ログアウト')

      # サインアップページへ遷移するボタンやログインページへ遷移するボタンが表示されていないことを確認する
      expect(page).to have_no_content('新規登録はこちら')
      expect(page).to have_no_content('ログインする')
    end
  end
  context 'ログインができないとき' do
    it '保存されているユーザーの情報と合致しないとログインができない' do
      # ログインページへ遷移する
      visit new_user_session_path

      # ユーザー情報を入力する
      fill_in 'session_email', with: ''
      fill_in 'session_password', with: ''
      
      # ログインボタンを押す
      click_on('ログインする')
      
      # ログインページへ戻されることを確認する
      expect(current_path).to eq(new_user_session_path)
    end
  end
end

