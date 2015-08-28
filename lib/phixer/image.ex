defmodule Phixer.Image do
  alias Phixer.Config
  alias Phixer.Image

  defstruct id: nil, small: nil, medium: nil, large: nil

  def from(%{id: id, small_url: small, medium_url: medium, large_url: large}) do
    %Image{id: id, small: file_names(small), medium: file_names(medium), large: file_names(large)}
  end

  def from(%{id: id, avatar_small: small, avatar: medium}) do
    %Image{id: id, small: file_names(small), medium: file_names(medium)}
  end

  defp file_names(url) do
    %{old: url |> strip_cloudfront, new: url |> strip_cloudfront |> new_file_name}
  end

  defp strip_cloudfront(url) do
    url |> String.replace(Config.aws_cloudfront_url, "")
  end

  defp new_file_name(url) do
    dirname   = Path.dirname(url)
    extension = Path.extname(url)
    basename  = Path.basename(url, extension)

    file_name = "#{basename}.jpg"

    [dirname, file_name] |> Path.join
  end
end
