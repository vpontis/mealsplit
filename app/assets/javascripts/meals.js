var populate_typeahead = function(){
  $('#auto_complete_restaurant').typeahead([      
    {
      name: 'name',
      remote: '/load_suggestions.json',
      valueKey: 'name',    
    }]);
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
    .attr('id', new_meal_participant_id);
  $(new_meal_participant).insertBefore('#add-participant-button');
  return new_meal_participant;
}