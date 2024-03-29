require_relative '../lib/inspiration'
require_relative '../lib/jokes'

describe Inspiration do
  describe '#learn_new_thing' do
    let(:learn) { Inspiration.new }
    let(:learn_json) { learn.learn_new_thing }

    it 'should return json response when the request is successful' do
      expect(learn_json.class).to eql(Array)
    end

    it 'should return response when an array is not empty' do
      expect(learn_json.length).to_not eql(0)
    end
  end

  describe '#random_quote' do
    let(:pick) { Inspiration.new }
    let(:pick_string) { pick.random_quote }

    it 'does not pick any quote if it is an empty array' do
      expect(pick_string.length).not_to eql(0)
    end

    it 'should return a Hash' do
      expect(pick_string.class).to eql(Hash)
    end

    it 'should return a key and a value' do
      expect(pick_string.length).to eql(2)
    end
  end
end

describe Joke do
  describe '#learn_new_thing' do
    let(:learn) { Joke.new }
    let(:learn_json) { learn.learn_new_thing }

    it 'should return hash response when the request is sucessful' do
      expect(learn_json.class).to eql(Hash)
    end

    it 'returns an array response should not be empty' do
      expect(learn_json.length).not_to eql(0)
    end

    it 'does not pick any joke if it is an empty array' do
      expect(learn_json.length).not_to eql(0)
    end
  end
end
