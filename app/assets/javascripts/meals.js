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
    event.preventDefault();
    $(this).addClass('active')
    $(this).siblings().removeClass('active');
    var tip_amount = $(this).attr('data-value');
    $('#meal_tip_percent').attr('value', tip_amount);
    $('.tip_parital').load('<%= escape_javascript(render partial: "meals/participant_tip", locals: {participant: participant}) %>')
  });
};