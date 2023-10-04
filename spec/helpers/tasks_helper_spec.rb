require 'rails_helper'

RSpec.describe TasksHelper, type: :helper do
  around do |example|
    Time.use_zone("Warsaw") { example.run }
  end

  describe '#deadline' do
    let(:task) { Task.new }

    context 'when task has a deadline' do
      it 'returns the formatted deadline' do
        task.deadline = Time.new(2023, 12, 31, 23, 59, 59).in_time_zone('Warsaw')
        expect(helper.deadline(task)).to eq '2023 December 31 at 23:59 pm'
      end
    end

    context 'when task does not have a deadline' do
      it 'returns "No deadline!"' do
        task.deadline = nil
        expect(helper.deadline(task)).to eq 'No deadline!'
      end
    end
  end
end
