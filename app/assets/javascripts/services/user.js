pathwayHomes.service("User", ["$http", function($http) {
  return {
    get: function(id) {
      return $http.get('/users/' + id + '.json');
    },

    post: function(data) {
      return $http.post('/users.json', data);
    },

    index: function(user_id, per_page, page) {
      var per_page = per_page || 5000;
      var page = page || 1;
      var params = '?per_page=' + per_page + '&page=' + page;
    //  if (user_id) {
    //    params += '&user_id=' + user_id;
    //  },

      return $http.get('/users.json' + params);
    }


  };
}]);
