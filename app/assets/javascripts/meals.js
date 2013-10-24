var populate_typeahead = function(){
  $('#auto_complete_restaurant').typeahead([      
    {
      name: 'name',
      remote: '/load_suggestions.json',
      valueKey: 'name',
      
    }]);
};