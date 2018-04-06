require 'test_helper'
require 'generators/ticket_it/install/install_generator'

module TicketIt
  class TicketIt::InstallGeneratorTest < Rails::Generators::TestCase
    tests TicketIt::InstallGenerator
    destination Rails.root.join('tmp/generators')
    setup :prepare_destination

    # test "generator runs without errors" do
    #   assert_nothing_raised do
    #     run_generator ["arguments"]
    #   end
    # end
  end
end
