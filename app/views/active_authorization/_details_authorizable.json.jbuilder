json.details do
  json.seeker seeker
  json.roles roles
  json.receiver receiver
  json.message_name message_name
  json.applied_authorizations authorizations.fetch(:applied)
  json.scoped_authorizations authorizations.fetch(:scoped)
  json.all_authorizations authorizations.fetch(:all)
end
