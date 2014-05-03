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
  
* `foreman`: Runs Heroku's foreman tool in a clean environment.

* `heroku`: Runs the Heroku command in a clean environment.

* `heroku_config_get`: Returns the value of an environment variable set for a particular Heroku app.

* `dbdeploy`: Runs [DBDeploy][dbd] to migrate your database

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
                         
### foreman

    foreman [[name, "value"]] "<foreman command line here>"
    
### heroku

    heroku ["cmd" "args"]

### heroku_config_get

    heroku_config_get "var", "heroku-app-name"
    
### dbdebploy

    dbdeploy classpath: "path to DBDeploy jar and DB driver jar", db_url: "DB URL to migrate",
             user: "User name", password: "password", driver: "Java class name for DB driver",
             migrations: "directory containing migration scripts"

The `driver` defaults to PostgreSQL. The `migrations` directory defaults to `src/db/migrations`, relative to the `Rakefile`. The `password` will not appear on any command line, or in any build logs.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

[dbd]: http://dbdeploy.com/
