// primary author: Vic
var populate_restaurant_typeahead = function(){
  $('#restaurant-name-input').typeahead(      
    {
      prefetch: '/restaurant_suggestions.json',
      ttl: 0,
    }
  );
};

var meal_participants = 1;
var add_meal_participant = function() {
  meal_participants += 1
  $('#meal-participants').attr('value', meal_participants);
  var new_meal_participant_id = 'meal_participant_' + meal_participants;
  var new_meal_participant = $('#meal-participant-1').clone();
  $(new_meal_participant).attr('id', 'meal-participant-' + meal_participants);
  $(new_meal_participant).find('label').attr('for', new_meal_participant_id);
  $(new_meal_participant).find('input')
    .attr('name', new_meal_participant_id)
    .attr('id', new_meal_participant_id)
    .val('');
  $(new_meal_participant).insertBefore('#add-participant-button');
  return new_meal_participant;
};

var setup_tip_buttons = function(){
 // make button toggles update hidden field
  $('#tip-percent-input .btn').on('click', function(event){
    // modify the buttons and set the tip value on the form
    event.preventDefault();
    $(this).addClass('active')
    $(this).siblings().removeClass('active');
    var tip_amount = $(this).attr('data-value');
    $('#meal_tip_percent').attr('value', tip_amount);

    $('.tip-value').each(function(i, e){
      var subtotal = $(e).attr('data-subtotal');
      var new_tip = parseFloat(tip_amount * subtotal);
      $(e).text('$' + new_tip.toFixed(2));

      var participant_id = $(e).attr('data-participant-id');
      var total_field = $(".total-value[data-participant-id="+participant_id+"]");
      var previous_total = parseFloat($(total_field).attr('data-total-without-tax'));
      var new_total = new_tip + previous_total;
      $(total_field).text('$' + new_total.toFixed(2));
    });

  });
};

var payer_chosen = function(elem){
  $('.payer-button').removeAttr('disabled').text('I paid!');
  $(elem).attr('disabled', 'disabled').text('Payer!');
  var email = $(elem).attr('data-email');
  $('#meal_payer_email').val(email);
};