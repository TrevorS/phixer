defmodule Mix.Tasks.Phixer.Rename do
  use Mix.Task

  @shortdoc "Rename incorrectly named images on S3"

  def run(_) do
    :ssl.start
    :erlcloud.start

    Phixer.rename(:listing_photos)
    Phixer.rename(:users)
  end
end
