defmodule LivesocketsWeb.SecondLive do
  use LivesocketsWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    IO.puts("-----------------")
    IO.puts("SecondLive mount")
    IO.inspect(socket.assigns)
    IO.inspect(self())
    IO.puts("-----------------")
    Process.send_after(self(), :new_value, 3000)
    {:ok, assign(socket, number: 0)}
  end

  @impl true
  def handle_event("suggest", %{"q" => query}, socket) do
    {:noreply, socket}
  end

  def handle_info(:new_value, socket) do
    IO.puts("handle_info secondPage")
    socket = assign(socket, number: Enum.random(1..5000))
    IO.inspect(socket.assigns)
    {:noreply, socket}
  end

  def render(assigns) do
    ~L"""
    <h1>SecondPage</h1>
    <%= assigns.number %>
    <br/>
    <br/>
    <%= live_patch "Go to FirstPage", to: Routes.live_path(@socket, LivesocketsWeb.PageLive) %>
    """
  end
end
