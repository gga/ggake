module Rake
  module DSL

    def s3cp(dir, options)
      # Done here to allow AWS::S3 to be an optional dependency
      require 'aws/s3'

      AWS::S3::Base.establish_connection!(:access_key_id => options[:access_key],
                                          :secret_access_key => options[:secret_key])
      cd dir do
        upload_sub_dir('.', options[:bucket])
      end
    end

    def upload_sub_dir(dir, bucket)
      Dir["#{dir}/*"].each do |file|
        if File.directory? file
          upload_sub_dir(file, bucket)
        else
          file_name = file.gsub("./", '')
          puts "Uploading: '#{file_name}'"
          AWS::S3::S3Object.store(file_name, open(file), bucket)
        end
      end
    end
  end

end
