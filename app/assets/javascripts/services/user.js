pathwayHomes.service("User", ["$http", function($http) {
  return {
    get: function(id) {
      console.log(id);
      return $http.get('/users/'+id+'.json');
    },

    post: function(data) {
      return $http.post('/users.json', data);
    }
  };
}]);
