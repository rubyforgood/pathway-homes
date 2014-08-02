angular.module('serviceReqestsFilters', []).filter('checkmark', function() {
  return function(input) {
    return pet ? '\u2713' : '\u2718';
  };
});