var populate_food_item_typeahead = function(restaurant_id){
  console.log(restaurant_id);
  $('.food-item-input').typeahead('destroy');
  $('.food-item-input').typeahead(      
    {
      prefetch: '/food_item_suggestions.json?restaurant_id=' + restaurant_id,
      ttl: 0
    }
  );
};

var food_items = 1;
var add_food_item = function() {
  food_items += 1
  $('#food-items').attr('value', food_items);
  var new_food_item_id = 'food_item_' + food_items;
  var new_food_item = $('#food-item-1').clone();
  $(new_food_item).attr('id', 'food-item-' + food_items);
  $(new_food_item).find('label').attr('for', new_food_item_id);
  $(new_food_item).find('input')
    .attr('name', new_food_item_id)
    .attr('id', new_food_item_id)
    .val('');
  $(new_food_item).insertBefore('#add-food-item-button');
  return new_food_item;
}