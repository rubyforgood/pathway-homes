pathwayHomes.filter('offset', function() {
  return function(arr, start) {
    array = arr || [];
    return array.slice(start, array.length);
  };
});
