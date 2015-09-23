# KaizEntry
A kaizen collection system for MasterControl

You must have Solr running on your machine to enable full text search and proper app functionality.
Run the following commands to enable full text search

1. `rails g sunspot_rails:install` to generate the solr yaml configuration file
2. `bundle exec rake sunspot:solr:run` to start the Solr service
3. `rake sunspot:reindex` if you already have data in your database