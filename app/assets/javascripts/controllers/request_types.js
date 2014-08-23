pathwayHomes.controller("RequestTypesCtlr", ["$scope", "$routeParams", "RequestType", function($scope, $routeParams, RequestType) {
  $scope.request_type = {};
  $scope.request_type.id = $('form').data('id');

  $scope.isValid = function(name) {
    return $scope.form['request_types[' + name + ']'].$valid;
  };

  RequestType.all().success(function(data) {
    $scope.request_types = data;
  });

  $scope.save = function($event) {
    if ($scope.form.$invalid) {
      $scope.alert("Please complete the form first", "danger");
      $event.preventDefault();
    }
    RequestType.post($scope.request_type).
     success(function(data) {
     $scope.alert("Record saved!", "success");
    }).
     error(function(data) {
     $scope.alert("Unable to save", "danger");
    });
    $event.preventDefault();
  };

}]);
