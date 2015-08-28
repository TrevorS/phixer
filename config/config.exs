# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

# This configuration is loaded before any dependency and is restricted
# to this project. If another project depends on this project, this
# file won't be loaded nor affect the parent project. For this reason,
# if you want to provide default values for your application for third-
# party users, it should be done in your mix.exs file.

# Sample configuration:
#
#     config :logger, :console,
#       level: :info,
#       format: "$date $time [$level] $metadata$message\n",
#       metadata: [:user_id]

config :phixer, :files,
  listing_photos: "data/listing_photos.csv",
  users: "data/users.csv"

config :phixer, :s3,
  aws_s3_url: "s3.amazonaws.com",
  aws_bucket_name: "pix.thestorefront.com",
  aws_cloudfront_url: "//d2zghkk09seiee.cloudfront.net/",
  aws_access_key_id: "dev_access_key_id",
  aws_secret_access_key: "dev_secret_access_key"
