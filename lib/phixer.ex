defmodule Phixer do
  alias Phixer.Config
  alias Phixer.Storage
  alias Phixer.Image

  @listing_photos_headers [:id, :small_url, :medium_url, :large_url]
  @users_headers [:id, :avatar, :avatar_small]

  def rename(:listing_photos) do
    IO.puts "Renaming Listing Photos"
    IO.puts "======================="
    Config.listing_photos |> to_images(headers: @listing_photos_headers) |> Enum.each(&Storage.copy/1)
  end

  def rename(:users) do
    IO.puts "Renaming Users"
    IO.puts "=============="
    Config.users |> to_images(headers: @users_headers) |> Enum.each(&Storage.copy/1)
  end

  def to_images(path, options) do
    path |> File.stream! |> CSV.decode(options) |> Enum.map(&Image.from/1)
  end
end
