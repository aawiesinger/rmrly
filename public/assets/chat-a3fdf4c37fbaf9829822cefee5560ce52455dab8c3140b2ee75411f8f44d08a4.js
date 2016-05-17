var scheme   = "ws://";
var uri      = scheme + window.document.location.host + "/";
var ws       = new WebSocket(uri);

ws.onmessage = function(message) {
  var data = JSON.parse(message.data);
  var table = document.getElementById("messages");
  var row = table.insertRow(table.rows.length-1);
  var cell1 = row.insertCell(0);
  cell1.innerHTML = "NEW CELL";
//  $("#chat-text").append("<div class='panel panel-default'><div class='panel-heading'>" + data.handle + "</div><div class='panel-body'>" + data.text + "</div></div>");
};


$("#button").on("click", function(event) {
//   event.preventDefault();
//   var text   = $("#input_text").value;
//   var pathArray = window.location.pathname.split( '/' );
//   var from_user = pathArray[2];
//   var to_user = pathArray[3];
//   ws.send(JSON.stringify({ to_user: to_user, from_user:  from_user,  text: text }));
  
  $("#input_text").value = "";
  alert("congrats you clicked the button")
});
