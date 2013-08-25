# ggake

Over time I've written a bunch of useful little functions and tasks
that have been handy in the build systems of my projects. Finally,
I've decided to collect these together.

You might also find some of these useful if you use
[Rake](http://rake.rubyforge.org/).

## Installation

Add this line to your application's Gemfile:

    gem 'ggake'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ggake

## Usage

This gem provides the following utilities:

* `haml_template`: Compiles a [Haml](http://haml.info/) template to an
  HTML file.
  
* `coffee`: Compiles a [CoffeeScript](http://coffeescript.org/) script
  to a JavaScript script.
  
* `transient`: Allows a Rake task to depend on a transient value,
  such as an environment variable.
  
* `cloud_cp`: Simple copy of a directory to an S3, or other cloud
  storage, bucket.

More detailed usage below.

### haml_template

    haml_template(path_to_haml_template, output: path_to_output_directory)

### coffee

    coffee(path_to_coffee, output: path_to_output_directory)

### transient

[What's this all about then?](http://overwatering.org/blog/2013/03/depending-on-transient-values-in-rake/)

    transient :calatrava_env, ENV['CALATRAVA_ENV']
    task :build => :calatrava_env

### cloud_cp

    cloud_ cp(directory, bucket: bucket_name,
                         credentials: {
                           access_key: aws_access_key,
                           secret_key: aws_secret_key
                         },
                         public: true)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
