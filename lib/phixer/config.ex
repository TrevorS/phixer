defmodule Phixer.Config do
  def listing_photos do
    System.get_env("LISTING_PHOTOS_CSV") || Application.get_env(:phixer, :files)[:listing_photos]
  end

  def users do
    System.get_env("USERS_CSV") || Application.get_env(:phixer, :files)[:users]
  end

  def aws_cloudfront_url do
    System.get_env("AWS_CLOUDFRONT_URL") || Application.get_env(:phixer, :s3)[:aws_cloudfront_url]
  end

  def aws_bucket_name do
    System.get_env("AWS_BUCKET_NAME") || Application.get_env(:phixer, :s3)[:aws_bucket_name]
  end

  def aws_access_key_id do
    System.get_env("AWS_ACCESS_KEY_ID") || Application.get_env(:phixer, :s3)[:aws_access_key_id]
  end

  def aws_secret_access_key do
    System.get_env("AWS_SECRET_ACCESS_KEY") || Application.get_env(:phixer, :s3)[:aws_secret_access_key]
  end

  def aws_s3_url do
    System.get_env("AWS_S3_URL") || Application.get_env(:phixer, :s3)[:aws_s3_url]
  end
end
