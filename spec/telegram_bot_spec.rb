require_relative '../lib/inspire.rb'
require_relative '../lib/joke.rb'

RSpec.describe Inspire do
  describe '#make_the_request' do
    let(:request) { Inspire.new } 
    let(:request_json) { request.make_the_request }

    it 'should return json response if the request is successful' do
      expect(request_json.class).to eql(Array)    
    end 
    
    it 'returned array response should not be empty' do
      expect(request_json.length).not_to eql(0)    
    end    
  end 
  
  describe '#select_random' do
    let(:random) { Inspire.new }
    let(:request_random) { random.select_random }

    it 'should return an Hash' do
      expect(request_random.class).to eql(Hash)    
    end    

    it 'should return a key and a value' do
      expect(request_random.length).to eql(2)    
    end    
  end  
end 


RSpec.describe Joke do
  describe '#make_the_request' do
    let(:request) { Joke.new }
    let(:request_json) { request.make_the_request }

    it 'returns hash response if the request is successful' do
      expect(request_json.class).to eql(Hash)    
    end
    
    it 'returned array response should not be empty' do
      expect(request_json.length).not_to eql(0)    
    end    
  end        
end    