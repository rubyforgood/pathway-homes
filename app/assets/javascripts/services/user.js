pathwayHomes.service("User", ["$http", function($http) {
  return {
    get: function() {
      return $http.get('/user.json');
    }
  };
}]);
