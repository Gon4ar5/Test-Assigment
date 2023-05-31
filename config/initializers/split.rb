Split.configure do |config|
  config.allow_multiple_experiments = true

  config.persistence = Split::Persistence::RedisAdapter.with_config(lookup_by: :current_user_id)

  config.experiments = YAML.load_file "config/experiments.yml"
end
