# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_compass_test_session',
  :secret      => '4508fcbcb61f94a7cd66f36f64b3ab72417bec25d57b8c5c1ead84b5deb49d62a1da5e72fbf1e5da14143bca10924fef7b8f87625795ed43be5c4b65e2589add'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
