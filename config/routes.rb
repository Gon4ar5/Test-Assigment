# frozen_string_literal: true

Rails.application.routes.draw do
  root to: "ab#perform_action"

  mount Split::Dashboard, at: "split"
end
