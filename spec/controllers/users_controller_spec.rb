require 'rails_helper'
include FactoryBot::Syntax::Methods

describe UsersController do
  describe 'update profile' do
    before do
      @student = create :student
      controller.session[:current_user_id] = @student.id
    end

    it 'should update the user record' do
      patch :profile_update,
            params: { profile: { major: 'computer science', grad_year: DateTime.new(2022), pronouns: 'He/Him/His',
                                 identities: 'something' } }
      @student.reload
      expect(@student.major).to eq 'computer science'
      expect(@student.grad_year).to eq DateTime.new(2022, 0o1, 0o1)
      expect(@student.pronouns).to eq 'He/Him/His'
      expect(@student.identities).to eq 'something'
    end

    it 'should not update user on skip' do
      @student.update(major: '', grad_year: nil, pronouns: '', identities: '')
      @student.reload
      patch :profile_update,
            params: { profile: { major: 'computer science', grad_year: DateTime.new(2022), pronouns: 'He/Him/His',
                                 identities: 'something', skip: 'Skip' } }
      expect(@student.major).to eq ''
      expect(@student.grad_year).to eq nil
      expect(@student.pronouns).to eq ''
      expect(@student.identities).to eq ''
    end

    it 'should redirect on logged-out user' do
      controller.session[:current_user_id] = ''
      patch :profile_update,
            params: { profile: { major: 'computer science', grad_year: DateTime.new(2022), pronouns: 'He/Him/His',
                                 identities: 'something', skip: 'Skip' } }
      expect(response).to redirect_to root_path
    end

    it 'should not say logged-in on profile edit' do
      controller.session[:current_user_id] = @student.id
      patch :profile_update,
            params: {
              profile: { major: 'computer science', grad_year: DateTime.new(2022), pronouns: 'He/Him/His',
                         identities: 'something' }, submit_edit: 'submit_edit'
            }
      expect(flash[:success]).to match(/Success! Your profile has been updated./)
    end
  end
end
