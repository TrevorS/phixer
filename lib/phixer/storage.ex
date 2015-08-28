defmodule Phixer.Storage do
  alias Phixer.Config
  alias Phixer.Image

  def copy(%Image{id: id, small: small, medium: medium, large: large}) do
    IO.puts "Copying Image with id #{id}:"
    [small, medium, large]
    |> Enum.reject(&is_nil/1)
    |> Enum.each(&copy_url/1)
  end

  defp copy_url(%{new: new_url, old: old_url}) do
    IO.puts "\told_url: #{old_url}\n\tnew_url: #{new_url}"
    :erlcloud_s3.copy_object(bucket_name, to_char_list(new_url), bucket_name, to_char_list(old_url), erlcloud_config)
  end

  defp bucket_name do
    Config.aws_bucket_name |> to_char_list
  end

  defp erlcloud_config do
    :erlcloud_s3.new(
      to_char_list(Config.aws_access_key_id),
      to_char_list(Config.aws_secret_access_key),
      to_char_list(Config.aws_s3_url)
    )
  end
end
