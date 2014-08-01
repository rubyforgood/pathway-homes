pathwayHomes.service("ServiceRequest", ["$http", function($http) {
  return {
    post: function(data) {
      return $http.post('/service_requests.json', data);
    }
  };
}]);
