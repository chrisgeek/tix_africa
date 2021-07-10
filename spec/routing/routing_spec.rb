
require 'rails_helper'

RSpec.describe 'Routing', type: :routing do
  describe 'Devise users authentication' do
    it { is_expected.to route(:get,    '/').to 'devise/sessions#new' }
    it { is_expected.to route(:get,    '/users/password/new').to  'devise/passwords#new' }
    it { is_expected.to route(:get,    '/users/password/edit').to 'devise/passwords#edit' }
    it { is_expected.to route(:post,   '/users/sign_in').to       'devise/sessions#create' }
    it { is_expected.to route(:delete, '/users/sign_out').to      'devise/sessions#destroy' }
    it { is_expected.to route(:patch,  '/users/password').to      'devise/passwords#update' }
    it { is_expected.to route(:put,    '/users/password').to      'devise/passwords#update' }
    it { is_expected.to route(:post,   '/users/password').to      'devise/passwords#create' }
    it { is_expected.to route(:get,    '/users/edit').to         'devise/registrations#edit' }
    it { is_expected.to route(:put,    '/users').to              'devise/registrations#update' }
  end

  describe 'events' do
    let(:p) { '/events' }
    let(:c) { 'events#' }

    it { is_expected.to route(:get, p).to 'events#index' }
    it { is_expected.to route(:get, "#{p}/1").to "#{c}show", id: 1 }
  end
end
