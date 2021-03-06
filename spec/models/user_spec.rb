require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、family_nameとfirst_name、furigana_family_nameとfurigana_first_name、birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが5文字以下だと登録できない' do
        @user.password = '00aaa'
        @user.password_confirmation = '00aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordが数字のみでは登録できない' do
        @user.password = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は半角英数字の両方を含める必要があります')
      end

      it 'passwordが英字のみでは登録できない' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は半角英数字の両方を含める必要があります')
      end

      it 'passwordが全角文字を含む場合は登録できない' do
        @user.password = 'ああああああ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は半角英数字の両方を含める必要があります')
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = 'aaa000'
        @user.password_confirmation = 'bbb000'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'family_nameが空では登録できない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end

      it 'family_nameは全角でないと登録できない' do
        @user.family_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name は全角文字を使用してください')
      end

      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it 'first_nameが全角でないと登録できない' do
        @user.first_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name は全角文字を使用してください')
      end

      it 'furigana_family_nameが空では登録できない' do
        @user.furigana_family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Furigana family name can't be blank")
      end

      it 'furigana_family_nameが全角でないと登録できない' do
        @user.furigana_family_name = 'あああ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Furigana family name は全角カタカナを使用してください')
      end

      it 'furigana_first_nameが空では登録できない' do
        @user.furigana_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Furigana first name can't be blank")
      end

      it 'furigana_first_nameが全角でないと登録できない' do
        @user.furigana_first_name = 'あああ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Furigana first name は全角カタカナを使用してください')
      end

      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
