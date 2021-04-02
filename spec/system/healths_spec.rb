require 'rails_helper'

RSpec.describe "健康記録", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @cat = FactoryBot.create(:cat)
    @cat.user_id = @user.id
    @health = FactoryBot.build(:health)
    @health.cat_id = @cat.id
    sleep 1
  end
  context '健康記録が登録できるとき' do
    it 'ログインしたユーザーはを自身の猫の健康記録が登録できる' do
      # ログインする
      visit new_user_session_path
      fill_in 'session_email', with: @user.email
      fill_in 'session_password', with: @user.password
      click_on('ログインする')
      expect(current_path).to eq(root_path)

      # 健康記録登録ページへのリンクがあることを確認する
      expect(page).to have_content('記録をつける')
      
      # 投稿ページに移動する
      visit new_health_path
      
      # フォームに情報を入力する
      # fill_in 'health_cat_name', with: @cat.name 
      fill_in 'health_recorded_date', with: @health.recorded_date 
      select @health.food.name, from: 'health_food_id' 
      select @health.tulle.name, from: 'health_tulle_id' 
      select @health.play.name, from: 'health_play_id' 
      fill_in 'health_weight', with: @health.weight
      select @health.poop.name, from: 'health_poop_id'
      select @health.pee.name, from: 'health_pee_id' 
      fill_in 'health_comment', with: @health.comment

      # 送信するとCatモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Health.count }.by(1)

      # トップページに遷移する
      visit root_path
    end
  end
end
