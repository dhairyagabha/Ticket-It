require 'rails/generators/active_record'

module Sender
  module Generators
    class InstallGenerator < Rails::Generators::Base
      include Rails::Generators::Migration
      source_root File.expand_path("../../templates", __FILE__)

      def create_migrations_file
        migration_template '', ''

      end

    end
  end
end