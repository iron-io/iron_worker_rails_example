## Iron Worker 101 Rails example

This example show how to work with iron_worker under Rails environment

## Getting Started

1. Set proper configuration in [iron.json](https://github.com/iron-io/iron_worker_rails_example/blob/master/iron.json) and [config_development.yml](https://github.com/iron-io/iron_worker_rails_example/blob/master/config_development.yml)

2. run 'rails s'

3. Go to http://localhost:3000 and test

## FAQ Rails+IronWorker
1.  Q:Where to place workers?

    A:Better to place workers in rails_root/workers dir like in example [worker dir](https://github.com/iron-io/iron_worker_rails_example/tree/master/workers)

2.  Q:How to use ActionMailer in worker?

    A:  merge mailer and template in [.worker file](https://github.com/iron-io/iron_worker_rails_example/blob/master/workers/simple_mailer_worker.worker)

    configure mailer in worker - [init_mailer](https://github.com/iron-io/iron_worker_rails_example/blob/master/workers/simple_mailer_worker.rb#L7)

    [send email](https://github.com/iron-io/iron_worker_rails_example/blob/master/workers/simple_mailer_worker.rb#L29)

