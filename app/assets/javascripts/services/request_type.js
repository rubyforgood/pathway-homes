pathwayHomes.service("RequestType", ["$http", function($http) {
  return {
    all: function() {
      return $http.get('/request_types.json');
    }
  };
}]);
