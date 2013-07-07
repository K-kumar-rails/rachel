$(document).ready(function(){
  cat_initialize_tipsy();  
});

var cat_initialize_tipsy = function(){
  $('.tipsy-tooltip').tipsy({
    title: function() { 
      return this.getAttribute('original-title'); 
    },
    html: true, 
    gravity: 'w'
  });
};
