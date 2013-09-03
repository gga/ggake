require 'aruba/cucumber'

require 'rake'
require 'ggake'

module GgakeWorld
  include Rake::DSL

  def run_haml(haml_file, output_dir = './')
    in_current_dir do
      file haml_file
      tname = haml_template(haml_file, output: output_dir)
      Rake::Task[tname].invoke
    end
  end

end

World(GgakeWorld)
