(function() {
  'use strict';

  angular
    .module('Fisioeng')
    .directive('graphPeriod', graphPeriod);

  function graphPeriod() {
    var directive = {
      restrict: 'A',
      require: ['ngModel'],
      link: link
    };

    return directive;

    function link(scope, element, attrs, controllers) {
      $(element).datetimepicker();
    }
  }
})();
