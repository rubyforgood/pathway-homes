pathwayHomes.controller("ServiceRequestsCtlr", ["$scope", "$routeParams", "ServiceRequest", "RequestType", "User", function($scope, $routeParams, ServiceRequest, RequestType, User) {
  //$scope.params = $routeParams;
  $scope.request = {};
  $scope.creator = {};
  $scope.request_types = [];
  $scope.request.id = $('form').data('id');

  RequestType.all().success(function(data) { 
    $scope.request_types = data;
  });

  User.get('current').success(function(data) {
    $scope.creator = data;
  });

  if ($scope.request.id) {
    ServiceRequest.get($scope.request.id).success(function(data) {
      $scope.request = data;
      $scope.request.type = _.findWhere($scope.request_types, {id: $scope.request.request_type_id});
      $scope.request.authorized_to_enter = $scope.request.authorized_to_enter.toString();
      $scope.request.pet = $scope.request.pet.toString();
      $scope.request.alarm = $scope.request.alarm.toString();
    });
  }

  $scope.isValid = function(name) {
    return $scope.form['service_request[' + name + ']'].$valid
  };
  
  $scope.save = function($event) {
    if ($scope.form.$invalid) {
      $scope.alert("Please complete the form first", "danger");
      $event.preventDefault();
    } 

    //ServiceRequest.post($scope.request).
    //  success(function(data) {
    //  $scope.alert("Record saved!", "success");
    //}).
    //  error(function(data) {
    //  $scope.alert("Unable to save", "danger");
    //});
  };
}]);
