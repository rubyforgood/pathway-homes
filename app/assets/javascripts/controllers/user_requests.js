pathwayHomes.controller('UserRequestsCtlr', ['$scope', 'ServiceRequest', function($scope, ServiceRequest) {
  $scope.title = 'Your Requests';
  $scope.requests = [];
  $scope.currentPage = 1;
  $scope.fetches = 1;
  $scope.perPage = 10;

  $scope.$watch('current_user_id', function(newValue) {
    if (newValue) {
      ServiceRequest.index($scope.current_user_id).success(function(data) {
        $scope.requests = data;
      });
    }
  });

  $scope.setPage = function(newPage) {
    $scope.currentPage = newPage;
    if (newPage + 1 >= $scope.pages($scope.requests, $scope.perPage).length) {
      $scope.fetches += 1;
      ServiceRequest.index($scope.current_user_id, 5000, $scope.fetches).success(function(data) {
        var requests = _.uniq(_.union($scope.requests, data), false, function(i, j) {
          return i.id;
        });
        $scope.requests = _.sortBy(requests, function(i) { 
          return i.id
        });
      });
    }
  };

}]);
