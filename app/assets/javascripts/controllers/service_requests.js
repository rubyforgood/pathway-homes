pathwayHomes.controller("ServiceRequestsCtlr", ["$scope", "ServiceRequest", function($scope, ServiceRequest) {
  $scope.request = {};
  $scope.request_types = ["test"];

  $scope.save = function() {
    ServiceRequest.post($scope.request).
      success(function(data) {
      $scope.alert("Saved!", 5000);
      console.log(data);
    }).
      error(function(data) {
      $scope.alert("Unable to save", 5000);
      console.log(data);
    });
  };
}]);
