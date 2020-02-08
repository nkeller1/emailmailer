require 'rails_helper'

describe 'Advice' do
  describe 'happy paths' do
    before(:each) do
      advice_data = {slip:
                      {advice: "Never waste an opportunity to tell someone you love them.",
                       slip_id: "202"}
                    }
      @advice = Advice.new(advice_data)
    end

    it 'should be created with advice_data' do
      expect(@advice).to be_an_instance_of(Advice)
    end

    it 'should have a message' do
      expect(@advice.message).to eq("Never waste an opportunity to tell someone you love them.")
    end
  end

  describe 'sad path' do
    it 'should not be created without advice_data' do
      expect { Advice.new }.to raise_error(ArgumentError)
    end
  end
end
