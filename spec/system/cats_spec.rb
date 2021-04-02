require 'rails_helper'

RSpec.describe "猫登録", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @cat = FactoryBot.build(:cat)
  end
  context '猫が登録できるとき' do
    it 'ログインしたユーザーは猫を登録できる' do
      # ログインする
      visit new_user_session_path
      fill_in 'session_email', with: @user.email
      fill_in 'session_password', with: @user.password
      click_on('ログインする')
      expect(current_path).to eq(root_path)

      # 猫登録ページへのリンクがあることを確認する
      expect(page).to have_content('うちの子を追加')
      
      # 投稿ページに移動する
      visit new_cat_path
      
      # フォームに情報を入力する
      attach_file 'cat_image', "public/images/test_image.jpg"
      fill_in 'cat_name', with: @cat.name
      select @cat.birthday.year, from: 'cat_birthday_1i' 
      select @cat.birthday.month, from: 'cat_birthday_2i'
      select @cat.birthday.day, from: 'cat_birthday_3i' 
      select @cat.gender.name, from: 'cat_gender_id' 
      fill_in 'cat_favorite', with: @cat.favorite

      # 送信するとCatモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Cat.count }.by(1)

      # トップページに遷移する
      visit root_path
    end
  end
  context '猫情報が登録ができないとき'do
    it 'ログインしていないと新規投稿ページに遷移できない' do
      # トップページに遷移しようとする
      visit root_path
      # ログインページに遷移する
      expect(current_path).to eq(new_user_session_path)
    end
  end
end

RSpec.describe '猫情報編集', type: :system do
  before do
    @cat1 = FactoryBot.create(:cat)
  end
  context '猫情報が登録できるとき' do
    it 'ログインしたユーザーは自分が登録した猫の編集ができる' do
      # 猫1を投稿したユーザーでログインする
      visit new_user_session_path
      fill_in 'session_email', with: @cat1.user.email 
      fill_in 'session_password', with: @cat1.user.password
      click_on ('ログインする')
      expect(current_path).to eq(root_path)
      # トップページに、cat1の「記録を見る」ボタンがあることを確認する
      expect(page).to have_link("#{@cat1.name}の記録をみる")
      # 詳細ページへ遷移する
      visit cat_path(@cat1)
      # 詳細ページに「プロフィールを編集する」ボタンがあることを確認する
      expect(page).to have_link("プロフィールを編集する")
      # 編集ページへ遷移する
      visit edit_cat_path(@cat1)
      # すでに登録済みの内容がフォームに入っていることを確認する
      expect(
        find('#cat_name').value
      ).to eq(@cat1.name)
      expect(page).to have_content(@cat1.birthday.year)
      expect(page).to have_content(@cat1.birthday.month)
      expect(page).to have_content(@cat1.birthday.day)
      expect(page).to have_content(@cat1.gender.name)
      # 登録内容を編集する
      fill_in 'cat_name', with: "#{@cat1.name}+編集"
      # 編集してもCatモデルのカウントは変わらないことを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Cat.count }.by(0)
      # 詳細ページへ遷移する
      visit cat_path(@cat1)
      # 詳細ページには先ほど変更した内容の猫情報が存在することを確認する
      expect(page).to have_content("#{@cat1.name}+編集")
    end
  end
end

RSpec.describe '猫情報削除', type: :system do
  before do
    @cat1 = FactoryBot.create(:cat)
  end
  context '猫情報の削除ができるとき' do
    it 'ログインしたユーザーは自らが登録した猫情報の削除ができる' do
      # cat1を投稿したユーザーでログインする
      visit new_user_session_path
      fill_in 'session_email', with: @cat1.user.email
      fill_in 'session_password', with: @cat1.user.password
      click_on ('ログインする')
      expect(current_path).to eq(root_path)
      # トップページに、cat1の「記録を見る」ボタンがあることを確認する
      expect(page).to have_link("#{@cat1.name}の記録をみる")
      # 詳細ページへ遷移する
      visit cat_path(@cat1)
      # 詳細ページに「プロフィールと記録を削除する」ボタンがあることを確認する
      expect(page).to have_link("プロフィールと記録を削除する")
      # 「プロフィールと記録を削除する」を押す
      expect{
        page.accept_confirm do
         click_on ('プロフィールと記録を削除する')
        end
        expect(current_path).to eq(root_path)
      }.to change { Cat.count }.by(-1)
      # トップページにはcat1の内容が存在しないことを確認する
      expect(page).to have_no_content("#{@cat1.name}の記録をみる")
    end
  end
end