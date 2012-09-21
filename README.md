## Iron Worker 101 Rails example
IronWorker integrates easily into a Rails application and lets you run and schedule workers in the cloud. After some config (iron.json, worker_name.worker files), it's matter of uploading the workers to IronWorker (inside or outside your app) and then calling them within your app when you want to.

This example show how to work with iron_worker under Rails environment

## Getting Started

1. Set proper configuration in [config_development.yml](https://github.com/iron-io/iron_worker_rails_example/blob/master/config_development.yml)

2. run 'rake iron_worker:upload'

3. run 'rails s'

4. Go to http://localhost:3000 and test

## FAQ Rails+IronWorker
1.  Q: Where should you place workers?

    A: Better to place workers in rails_root/workers dir like in example [worker dir](https://github.com/iron-io/iron_worker_rails_example/tree/master/workers)

2.  Q: How do you upload workers?

    A: You can upload workers in a number of ways:
    *    rake task (rake iron_worker:upload) - [iron_worker.rake](https://github.com/iron-io/iron_worker_rails_example/blob/master/lib/tasks/iron_worker.rake) - use this approach when you have deploy script or scenario and you want control when and which workers you want to upload
    *    initializer - [iron_worker](https://github.com/iron-io/iron_worker_rails_example/blob/master/config/initializers/iron_worker.rb#L4) - use this approach when you want to be ensure that all your workers always are up to date (but don't forget that workers will be uploaded every time you restart rails)
    *    controller/model - [controller](https://github.com/iron-io/iron_worker_rails_example/blob/master/app/controllers/codes_controller.rb#L8) - we don't recommend to upload workers from controllers or models, but with this approach you could upload/modify workers without touching rails

3.  Q: How do you use ActionMailer within a worker?

    A: Simple. Just take the following steps:
    *    merge mailer and template in [.worker file](https://github.com/iron-io/iron_worker_rails_example/blob/master/workers/simple_mailer_worker.worker)
    *    send connection details as parameter [mailer details](https://github.com/iron-io/iron_worker_rails_example/blob/master/app/controllers/custom_examples_controller.rb#L6)
    *    configure mailer in worker - [init_mailer](https://github.com/iron-io/iron_worker_rails_example/blob/master/workers/simple_mailer_worker.rb#L7)
    *    [send email](https://github.com/iron-io/iron_worker_rails_example/blob/master/workers/simple_mailer_worker.rb#L29)

Important note, if you're passing ActionMailer config hash as worker params you need to convert them on worker side to 'valid' hash([example](https://github.com/iron-io/iron_worker_rails_example/blob/master/workers/simple_mailer_worker.rb#L9)).

4.  Q: How do you use Models and/or connect to a database within a worker?

    A: It's easy. Here's how:
    *    merge models in [.worker file](https://github.com/iron-io/iron_worker_rails_example/blob/master/workers/simple_mailer_worker.worker)
    *    send connection details as parameter [database details](https://github.com/iron-io/iron_worker_rails_example/blob/master/app/controllers/custom_examples_controller.rb#L6)
    *    configure database connection in worker - [setup_database](https://github.com/iron-io/iron_worker_rails_example/blob/master/workers/simple_mailer_worker.rb#L16)
    *    [use model](https://github.com/iron-io/iron_worker_rails_example/blob/master/workers/simple_mailer_worker.rb#L29)

5.  Q: How to get processed data back from worker?

    A: There are few ways:
    *    Write processed data directly to db (need to configure connection and use models)
    *    Store data in external persister like IronCache (look at [DeserializeWorker](https://github.com/iron-io/iron_worker_rails_example/blob/master/workers/deserialize_worker.rb))
    *    Send/Recieve data via IronMQ (look at [WebCrawler](https://github.com/iron-io/iron_worker_examples/tree/master/ruby_ng/web_crawler_nokogiri) example)
