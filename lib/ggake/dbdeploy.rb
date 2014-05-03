require 'open3'

module Rake
  module DSL

    def dbdeploy(opts)
      opts[:driver] ||= 'org.postgresql.Driver'
      opts[:migrations] ||= 'src/db/migrations'
      opts[:password] = "\n" if !opts[:password] || opts[:password].empty?

      java_args = ["-cp", opts[:classpath],
                   "com.dbdeploy.CommandLineTarget",
                   "--driver", opts[:driver],
                   "--url", opts[:db_url],
                   '--scriptdirectory', opts[:migrations],
                   '--userid', opts[:user],
                   '--password']
      Open3.popen2("java", *java_args) do |i, o, w|
        i.print opts[:password]
        i.close
        
        $stdout.print(o.gets)
      end
    end

  end
end
