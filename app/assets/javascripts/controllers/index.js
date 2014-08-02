pathwayHomes.controller('IndexController', ['$scope', '$http', function ($scope, $http) {
  $http.get('service_requests.json').success(function(data) {
    $scope.requests = data;
    console.log(data);
  });
}]);