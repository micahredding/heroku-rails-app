$(document).ready(function(){

  $('form').submit(function() {
      var valuesToSubmit = $(this).serialize();
      $.ajax({
          type: "POST",
          url: $(this).attr('action'),
          data: valuesToSubmit,
          dataType: "JSON"
      }).success(function(json){
          console.log("success", json);
          message = json;
          $('#message-list').append(
            '<li id="message-id-' + message.id + '">'
            + message.content
            + ' - ' + message.creator.email
            + '</li>'
          );
      });
      return false;
  });

  function checkForNewMessages() {
    $.ajax({
      type: 'GET',
      url: '/team/1/channels/1/messages.json',
      data: {},
      dataType: 'JSON'
    }).success(function(json){
      console.log("success", json);
    });
  }

  checkForNewMessages();

});

