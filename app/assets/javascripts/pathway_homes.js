var pathwayHomes = angular.module("pathwayHomes", ['ngRoute', "localytics.directives"]);

pathwayHomes.directive('dateField', function() {
  return {
    require: 'ngModel',
    link: function (scope, elem, attrs, ngModel) {
      var toView = function(val) {
        console.log(val);
        if (val === undefined) {
          return "";
        } else {
          return val.getFullYear() + "-" + (val.getMonth() + 1) + "-" + val.getDate();
        }
      };

      var toModel = function(val) {
        console.log(val);
        if (val === undefined) {
          return "";
        } else {
          return new Date(val);
        }
      };

      ngModel.$formatters.unshift(toView);
      ngModel.$parsers.unshift(toModel);
    }
  };
});

//pathwayHomes.config(["$routeProvider", "$locationProvider", function($routeProvider, $locationProvider) {
//  $routeProvider.
//    when("/service_requests/new", {controller: 'ServiceRequestsCtlr'});
//
//  $locationProvider.html5Mode(true);
//}]);
