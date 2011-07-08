$: << "."
require 'pamela'
require 'usd2cop'

Pamela.load :test, :console

desc "This task is called by the Heroku cron add-on"
task :cron do
  include Helpers
  update_twitter_account
end
