pathwayHomes.service("User", ["$http", function($http) {
  return {
    post: function(data) {
      return $http.post('/users.json', data);
    }
  };
}]);
