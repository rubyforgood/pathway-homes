pathwayHomes.service("RequestType", ["$http", function($http) {
  return {
    all: function() {
      return $http.get('/request_types.json');
    },
    post: function(data) {
      return $http.post('/request_types.json', data);
    },

    get: function(id) {
      return $http.get('/request_types/' + id + '.json');
    }
  };
}]);
