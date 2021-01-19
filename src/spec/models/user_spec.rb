# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  activated       :boolean          default(FALSE), not null
#  admin           :boolean          default(FALSE), not null
#  birthday        :date
#  email           :string(255)      not null
#  name            :string(255)      not null
#  password_digest :string(255)      not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require 'rails_helper'

RSpec.describe User, type: :model do
  # テストの対象を記載
  describe '#age' do
    before do
      allow(Time.zone).to receive(:now).and_return(Time.zone.parse('2018/04/01'))
    end
    # 条件の記載
    context '20年前の生年月日の場合' do
      # 対象(ユーザー)の記載
      let(:user) { User.new(birthday: Time.zone.now - 20.years) }

      # 最終的なテスト結果の正解である結果を記載
      it '年齢が20歳であること' do
        # expectの値とeqの引数がイコールであれば正しいと判断
        expect(user.age).to eq 20
      end
    end

    context '10年前に生まれた場合でちょうど誕生日の場合' do
      let(:user) { User.new(birthday: Time.zone.parse('2008/04/01'))}

      it '年齢が10歳であること' do
        expect(user.age).to eq 10
      end
    end

    context '10年前に生まれた場合で誕生日が来ていない場合' do
      let(:user) { User.new(birthday: Time.zone.parse('2008/04/01'))}

      it '年齢が9歳であること' do
        expect(user.age).to eq 9
      end
    end

  end
end
