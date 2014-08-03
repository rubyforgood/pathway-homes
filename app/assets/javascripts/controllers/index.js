pathwayHomes.controller('IndexController', ['$scope', 'ServiceRequest', function ($scope, ServiceRequest) {
  $scope.page = 1;
  $scope.fetches = 1;
  $scope.creatorPage = 1;
  $scope.creatorFetches = 1;

  ServiceRequest.index().success(function(data) {
    $scope.requests = data;
  });

  $scope.$watch('creator.id', function(newValue) {
    if (newValue) {
      ServiceRequest.index($scope.creator.id).success(function(data) {
        $scope.creator_requests = data;
      });
    }
  });

  $scope.pages = function(collection, perPage) {
    if (collection && collection.length > 0) {
      numberOfPages = parseInt(collection.length / perPage + 1);
      return _.range(numberOfPages);
    } else {
      return [];
    }
  };

  $scope.isActive = function(index) {
    if (index + 1 === $scope.page) {
      return 'active';
    }
  };

  $scope.isCreatorActive = function(index) {
    if (index + 1 === $scope.creatorPage) {
      return 'active';
    }
  };

  $scope.setPage = function(newPage) {
    $scope.page = newPage;
    if (newPage + 1 >= $scope.pages($scope.requests, 10).length) {
      $scope.fetches += 1;
      ServiceRequest.index(null, 5000, $scope.fetches).success(function(data) {
        $scope.requests = _.uniq(_.union($scope.requests, data), false, function(i, j) {
          return i.id;
        });
        $scope.requests = _.sortBy($scope.requests, function(i) { 
          return i.id
        });
      });
    }
  };

  $scope.setCreatorPage = function(newPage) {
    $scope.creatorPage = newPage;

    if (newPage + 1 >= $scope.pages($scope.creator_requests, 10).length) {
      $scope.creatorFetches += 1;
      ServiceRequest.index($scope.creator.id, 5000, $scope.creatorFetches).success(function(data) {
        $scope.creator_requests = _.uniq(_.union($scope.creator_requests, data), false, function(i, j) {
          return i.id;
        });
        $scope.creator_requests = _.sortBy($scope.creator_requests, function(i) { 
          return i.id
        });
      });
    }
  };
}]);
