namespace :ticket_it do

  # rails g ticket_it:install
  desc "General installation task for creating a ticket it initialization file."
  task install: :environment do
  end

  # rails g ticket_it:models
  desc "Generate namespaced model files in the host project directory."
  task models: :environment do
  end

  # rails g ticket_it:controllers
  desc "Generate namespaced controller files in the host project directory."
  task controllers: :environment do
  end

  # rails g ticket_it:views
  desc "Generate namespaced views files in the host project directory."
  task views: :environment do
  end

  # rails g ticket_it:migrations
  desc "Generate migrations in the host project directory."
  task migrations: :environment do
  end

end
