require 'rails_helper'

RSpec.describe TaskDecorator, type: :decorator do
  let(:user) { create(:user) } # From factory
  subject { TaskDecorator.new(user) }

  describe '#created_at' do
    before { Timecop.freeze("2015-05-06 10:00".to_time) }

    specify 'that the correct format is used' do
      expect(subject.created_at).to eq('2015-05-06')
    end
  end
end
