pathwayHomes.service("User", ["$http", function($http) {
  return {
    get: function() {
      return $http.get('/user.json');
    },

    post: function(data) {
      return $http.post('/users.json', data);
    }
  };
}]);
