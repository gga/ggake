module Rake
  module DSL

    def haml_template(tmpl, options)
      File.join(options[:output], tmpl).ext('html').tap do |html_file|
        file html_file => tmpl do
          sh "haml #{tmpl} #{html_file}"
        end
      end
    end

  end
end
