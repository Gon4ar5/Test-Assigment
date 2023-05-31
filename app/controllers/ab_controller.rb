class AbController < ApplicationController
  def perform_action
    create_experiments(current_user) if current_user.experiments.empty?
    experiments = current_user.experiments.map do |exp| 
      { name: exp.name, value: exp.value }
    end
    render json: { experiments: experiments }
  end

  def create_experiments(current_user)
    YAML.load_file("config/experiments.yml").keys.each do |exp|
      Experiment.create!(user: current_user, name: exp, value: ab_test(exp.to_sym))
    end
  end
end