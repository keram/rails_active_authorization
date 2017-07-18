json.partial! 'active_authorization/forbidden'
json.partial! 'active_authorization/details_'
  .concat(details.fetch(:type)),
              locals: authorization_locals(details)
