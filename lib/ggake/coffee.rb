module Rake
  module DSL

    def coffee(input, options)
      File.join(options[:output], File.basename(input)).ext('js').tap do |js_file|
        file js_file => input do
          sh "coffee --compile --output #{options[:output]} #{input}"
        end
      end
    end

  end
end
