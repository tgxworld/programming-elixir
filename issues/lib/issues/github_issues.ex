defmodule Issues.GithubIssues do
  @user_agent [{"User-agent", "Elixir dave@pragprog.com"}]
  @github_url Application.get_env(:issues, :github_url)

  def fetch(user, project) do
    issues_url(user, project)
    |> HTTPoison.get(@user_agent)
    |> handle_response
  end

  def issues_url(user, project) do
    "#{@github_url}/repos/#{user}/#{project}/issues"
  end

  def handle_response({ :ok, %{status_code: 200, body: body} }), do: { :ok, parse_body body }
  def handle_response({ _, %{status_code: _, body: body} }), do: { :error, parse_body body }

  defp parse_body(body) do
    Poison.Parser.parse! body
  end
end
