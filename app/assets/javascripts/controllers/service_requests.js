pathwayHomes.controller("ServiceRequestsCtlr", ["$scope", "$routeParams", "ServiceRequest", function($scope, $routeParams, ServiceRequest) {
  //$scope.params = $routeParams;
  $scope.request = {};
  $scope.request_types = ["test"];

  $scope.save = function() {
    ServiceRequest.post($scope.request).
      success(function(data) {
      $scope.alert("Record saved!", "success");
    }).
      error(function(data) {
      $scope.alert("Unable to save", "danger");
    });
  };
}]);
