$(document).ready(function() {

  $('#add_comment').click(function(event){
    event.preventDefault();

    $(this).hide();

    var url = $(this).attr('href');
   

    $.get(url, function(serverResponse, status, request){
      $('#comment_section').append(serverResponse);
    });
  });

  $('#comment_section').on('submit', '#new_comment', function(event){
    event.preventDefault();

    var url = $(this).attr('action');
    var data = $(this).serialize();

    $.post(url, data, function(serverResponse, status, request){
      $('#comment_section').append(serverResponse);
    });

    $(this).parent('div').remove();

    $('#add_comment').show();
  });

});

$(document).ready(function() {

  $('#add_post').click(function(event){
    event.preventDefault();

    $(this).hide();

    var url = $(this).attr('href');
   

    $.get(url, function(serverResponse, status, request){
      $('#user_prof').append(serverResponse);
    });
  });

  $('#post_section').on('submit', '#new_post', function(event){
    event.preventDefault();

    var url = $(this).attr('action');
    var data = $(this).serialize();

    $.post(url, data, function(serverResponse, status, request){
      $('#post_section').append(serverResponse);
    });

    $(this).parent('div').remove();

    $('#add_post').show();
  });

});