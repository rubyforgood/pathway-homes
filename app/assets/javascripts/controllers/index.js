pathwayHomes.controller('IndexController', ['$scope', 'ServiceRequest', function ($scope, ServiceRequest) {
  $scope.pages = function(collection, perPage) {
    if (collection && collection.length > 0) {
      numberOfPages = parseInt(collection.length / perPage + 1);
      return _.range(numberOfPages);
    } else {
      return [];
    }
  };
}]);
