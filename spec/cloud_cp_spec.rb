require 'spec_helper'
require 'fog'
require 'rake'

describe 'cloud_cp' do
  include Rake::DSL

  let(:options) do
    {
      credentials: {
        provider: 'AWS',
        aws_access_key_id: 'whatever',
        aws_secret_access_key: 'asdf'
      },
      bucket: 'my_bucket',
      public: true
    }
  end
  let(:directory) { 'lib' }

  before :each do
    Fog.mock!

    connection = Fog::Storage.new(options[:credentials])
    connection.directories.create(key: options[:bucket],
                                  public: options[:public])
  end

  it 'should copy all directories to the cloud' do
    cloud_cp(directory, options)
  end

end
