module Rake
  module DSL

    def haml_template(tmpl, options)
      extras = ''
      lib_dir = options[:lib]
      if lib_dir
        libraries = Dir["#{lib_dir}/*.rb"].collect { |l| File.basename(l, '*.rb') }
        extras << "-I#{lib_dir} "
        extras << libraries.collect { |l| "-r#{l}" }.join(' ')
      end
      File.join(options[:output], File.basename(tmpl)).ext('html').tap do |html_file|
        directory options[:output]
        file html_file => [options[:output], tmpl] do
          sh "haml -t ugly #{extras} #{tmpl} #{html_file}"
        end
      end
    end

  end
end
