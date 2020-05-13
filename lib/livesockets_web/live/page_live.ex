defmodule LivesocketsWeb.PageLive do
  use LivesocketsWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    IO.puts("-----------------")
    IO.puts("pageLive mount")
    IO.inspect(socket.assigns)
    IO.inspect(self())
    IO.puts("-----------------")
    {:ok, assign(socket, query: "", results: %{})}
  end

  def render(assigns) do
    ~L"""
    <section class="phx-hero">
      <h1><%= gettext "Welcome to %{name}!", name: "Phoenix" %></h1>
      <p>Peace-of-mind from prototype to production</p>

      <%= live_patch "SecondPage", to: Routes.live_path(@socket, LivesocketsWeb.SecondLive) %>
    </section>
    """
  end
end
