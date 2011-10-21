require 'test_helper'

describe Amiando::ApiKey do
  before do
    Amiando.api_key = nil
    HydraCache.prefix = 'ApiKey'
  end

  describe 'create' do
    it 'creates an api key' do
      key = Amiando::ApiKey.create :name => 'wadus'
      Amiando.run

      key.id.wont_be_nil
      key.name.must_equal 'wadus'
      key.identifier.wont_be_nil
      key.key.wont_be_nil
      key.enabled.wont_be_nil
    end

    it 'fails when creating with empty parameters' do
      lambda { key = Amiando::ApiKey.create({}) }.must_raise ArgumentError
    end

  end

  describe 'update' do
    it 'can update its enabled attribute' do
      key = Amiando::ApiKey.create :name => 'wadus'
      Amiando.run

      Amiando.api_key = key.key

      result = Amiando::ApiKey.update(key.id, :enabled => false)
      Amiando.run

      result.success.must_equal true
    end

    it 'update raises NotAuthorized if apikey doesnt have permission to update the apikey' do
      key1 = Amiando::ApiKey.create :name => 'wadus'
      key2 = Amiando::ApiKey.create :name => 'wadus1'
      Amiando.run

      Amiando.api_key = key1.key

      lambda {
        result = Amiando::ApiKey.update(key2.id, :enabled => false)
        Amiando.run
      }.must_raise Amiando::Error::NotAuthorized
    end

    it 'update fails if apikey is missing' do
      key = Amiando::ApiKey.create :name => 'wadus'
      Amiando.run

      result = Amiando::ApiKey.update(key.id, :enabled => false)
      Amiando.run

      result.success.must_equal false
    end
  end

  # it 'raises an error when updating an api key that doesnt exist' do
  # end
end
