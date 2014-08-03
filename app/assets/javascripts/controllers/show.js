pathwayHomes.controller('ShowController', ['$scope', '$http', function ($scope, $http) {
  var requestID = $("[ng-controller=ShowController]").data("id");
  $http.get('/service_requests/' + requestID + '.json').success(function(data) {
    $scope.service_request = data;
  });
}]);
