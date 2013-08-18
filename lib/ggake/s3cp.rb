module Rake
  module DSL

    def s3cp(dir, options)
      # Done here to allow fog to be an optional dependency
      require 'fog'

        connection = Fog::Storage.new(options[:credentials])
      cd dir do
        upload_sub_dir(connection, '.', options[:bucket], options[:public])
      end
    end

    def upload_sub_dir(connection, dir, bucket, is_public = false)
      is_public ||= false
      Dir["#{dir}/*"].each do |file|
        if File.directory? file
          upload_sub_dir(connection, file, bucket, is_public)
        else
          file_name = file.gsub("./", '')
          puts "Uploading: '#{file_name}'"
          directory = connection.directories.get(bucket)
          file = directory.files.create(
            :key    => file_name,
            :body   => open(file),
            :public => is_public
          )
        end
      end
    end
  end

end
