# config/initializers/sidekiq_scheduler.rb
require 'sidekiq/scheduler'

Sidekiq.configure_server do |config|

  config.on(:startup) do
    Sidekiq.schedule = YAML
      .load_file(File.expand_path('../../scheduler.yml', __FILE__))
    Sidekiq::Scheduler.reload_schedule!
  end

end

if (!defined?(Rails::Server))
  Sidekiq::Scheduler.enabled = true
end
