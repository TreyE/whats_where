import { Socket } from "phoenix"

function setupChangeElementListener() {
  var changeElement = document.getElementById("whats_where_deployment_update_listener");
  if (changeElement != null) {
    let socket = new Socket("/socket", {});
    socket.connect();
    let channel = socket.channel("deployment_updates");
    channel.join();
    channel.on("deployments_updated", function(msg) {
      window.location.reload();
    });
  }
}

document.addEventListener("DOMContentLoaded", function(event) { 
  setupChangeElementListener();
});