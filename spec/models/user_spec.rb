require 'rails_helper'

RSpec.describe User, type: :model do
  describe '新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end
    context '新規登録がうまく行くとき' do
      it '全ての項目が存在すれば登録できること' do
        expect(@user).to be_valid
      end

      it 'パスワードが6文字以上の時登録できること' do
        @user.password = '12345a'
        @user.password_confirmation = '12345a'
        expect(@user).to be_valid
      end

      it 'パスワードが半角英数字が混合されていれば登録できること' do
        @user.password = '123456a'
        @user.password_confirmation = '123456a'
        expect(@user).to be_valid
      end
    end
    context '新規登録がうまくいかないとき' do
      it 'ニックネームが存在しないと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'メールアドレスが存在しないと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'メールアドレスが重複すると登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'メールアドレスに@が含まれていないと登録できない' do
        @user.email = 'uhuhu'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'パスワードが存在しないと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'パスワードが5文字以下だと登録できない' do
        @user.password = '1234a'
        @user.password_confirmation = '1234a'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'パスワードが半角英数字混合でないと入力できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
      end

      it 'passwordとpassword_confirmationが不一致では登録できないこと' do
        @user.password = '123456a'
        @user.password_confirmation = '1234567a'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it '苗字が存在しないと登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it '名前が存在しないと登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it '苗字は全角(漢字、ひらがな、カタカナ)でないと登録できない' do
        @user.last_name = 'abc'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid. Input full-width characters')
      end

      it '名前は全角(漢字、ひらがな、カタカナ)でないと登録できない' do
        @user.first_name = 'abc'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid. Input full-width characters')
      end

      it '苗字のフリガナが存在しないと登録できない' do
        @user.last_read = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last read can't be blank")
      end

      it '名前のフリガナが存在しないと登録できない' do
        @user.first_read = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First read can't be blank")
      end

      it '苗字のフリガナは全角(カタカナ)でないと登録できない' do
        @user.last_read = 'abc'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last read is invalid. Input full-width katakana characters')
      end

      it '名前のフリガナは全角(カタカナ)でないと登録できない' do
        @user.first_read = 'abc'
        @user.valid?
        expect(@user.errors.full_messages).to include('First read is invalid. Input full-width katakana characters')
      end

      it '生年月日が存在しないと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
