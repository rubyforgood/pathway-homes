pathwayHomes.service("ServiceRequest", ["$http", function($http) {
  return {
    post: function(data) {
      return $http.post('/service_requests.json', data);
    },

    get: function(id) {
      return $http.get('/service_requests/' + id + '.json');
    },

    index: function(user_id, per_page, page) {
      var per_page = per_page || 5000;
      var page = page || 1;
      var params = '?per_page=' + per_page + '&page=' + page;
      if (user_id) {
        params += '&user_id=' + user_id;
      }

      return $http.get('/service_requests.json' + params);
    }
  };
}]);
