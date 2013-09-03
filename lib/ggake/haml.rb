module Rake
  module DSL

    def haml_template(tmpl, options)
      File.join(options[:output], File.basename(tmpl)).ext('html').tap do |html_file|
        directory options[:output]
        file html_file => [options[:output], tmpl] do
          sh "haml #{tmpl} #{html_file}"
        end
      end
    end

  end
end
