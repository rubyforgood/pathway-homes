pathwayHomes.controller("ServiceRequestsCtlr", ["$scope", "ServiceRequest", function($scope, ServiceRequest) {
  $scope.request = {};
  $scope.request_types = ["test"];

  $scope.save = function() {
    ServiceRequest.post($scope.request).
      success(function(data) {
      $scope.alert("Saved!", "success");
      console.log(data);
    }).
      error(function(data) {
      $scope.alert("Unable to save", "danger");
      console.log(data);
    });
  };
}]);
