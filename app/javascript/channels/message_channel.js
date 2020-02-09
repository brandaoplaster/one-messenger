import consumer from "./consumer"

consumer.subscriptions.create("MessageChannel", {
  connected() {
    console.log("Conected at MessageChannel")
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    let messageContainer = document.querySelector("div.message-container");
    messageContainer.innerHTML += data;
    messageContainer.scrollIntoView(false);
  }
});
