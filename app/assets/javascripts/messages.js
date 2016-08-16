$(document).ready(function(){
  setInterval(function(){
    $.ajax({
      method: 'GET',
      url: '/teams/1/channels/1/messages.json',
      dataType: 'JSON'
    }).done(function(messages){
      messages.forEach(function(message){
        if($('#message-id-' + message.id).length) {
          $('#message-id-' + message.id).html(message.content);
        } else {
          $("#messages-list").append(
            "<li id='message-id-"
            + message.id
            + "'>"
            + message.content
            + "</li>"
          );
        }
      });
    });

  }, 10000);


  $('form').submit(function() {
    var valuesToSubmit = $(this).serialize();
    $.ajax({
        type: "POST",
        url: $(this).attr('action'),
        data: valuesToSubmit,
        dataType: "JSON"
    }).success(function(json){
        console.log("success", json);

    });
    return false;
  });



});