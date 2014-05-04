require 'bundler'

module Rake
  module DSL
    
    def foreman(env_vars, cmd)
      Bundler.with_clean_env do
        sh "#{env_vars.collect { |var| var.join('=') }.join(' ')} foreman #{cmd}"
      end
    end

    def heroku(*cmd_args)
      Bundler.with_clean_env do
        sh "heroku #{ cmd_args.join(' ') }"
      end
    end

    def heroku_config_get(var, app)
      Bundler.with_clean_env do
        `heroku config:get #{var} --app #{app}`.chomp
      end
    end

  end
end

class HerokuApp
  include Rake::DSL
  
  def initialize(name, heroku_name = nil)
    @name, @heroku_name = name, heroku_name
    @heroku_name ||= @name
  end

  def package(artefact)
    "package/#{@name}".tap do |pkg_dir|
      mkdir_p pkg_dir
      cp "heroku/Procfile.#{@name}", "#{pkg_dir}/Procfile"
      cp artefact, pkg_dir
    end
  end

  def push
    heroku "push package/#{@name} --app #{@heroku_name}"
  end

  def config(var)
    heroku_config_get(var, @heroku_name)
  end
end
