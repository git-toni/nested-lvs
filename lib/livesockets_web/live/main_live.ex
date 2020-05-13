defmodule LivesocketsWeb.MainLive do
  use LivesocketsWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    IO.puts("-----------------")
    IO.puts("Mainlive mount")
    IO.inspect(socket.assigns)
    IO.inspect(self())
    IO.puts("-----------------")
    {:ok, socket}
  end

  def render(assigns) do
    IO.inspect(assigns)
    # <%= @inner_content %>
    ~L"""
    <h1>MainLive</h1>
    <br/>
    <%= live_patch "FirstPage", to: Routes.live_path(@socket, LivesocketsWeb.PageLive) %>
    <br/>
    <br/>
    <%= live_patch "SecondPage", to: Routes.live_path(@socket, LivesocketsWeb.SecondLive) %>
    """
  end
end
