defmodule LivesocketsWeb.PageLive do
  use LivesocketsWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    IO.puts("-----------------")
    IO.puts("PageLive mount")
    IO.inspect(socket.assigns)
    IO.inspect(self())
    IO.puts("-----------------")
    {:ok, assign(socket, query: "", results: %{})}
  end

  def render(assigns) do
    IO.puts("pagelive render ")
    IO.inspect(assigns)
    IO.inspect(self())

    ~L"""
    <section class="phx-hero">
      <h1>...</h1>
      <p>____</p>

      <%= live_redirect "SecondPage", to: Routes.live_path(@socket, LivesocketsWeb.SecondLive) %>
    </section>
    """
  end
end
