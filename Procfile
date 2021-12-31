web: bundle exec puma -t 5:5 -p ${PORT:-9292} -e ${RACK_ENV:-development}
worker: bundle exec shoryuken -r ./workers/citation_tree_worker.rb -C ./workers/shoryuken.yml