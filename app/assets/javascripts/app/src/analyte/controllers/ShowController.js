(function() {
  'use strict';

  angular
    .module('Fisioeng')
    .controller('ShowAnalyteController', ShowAnalyteController);

  ShowAnalyteController.$inject = ['$scope'];

  function ShowAnalyteController($scope) {
    $scope.chartSeries = [
      {
        "name": "Temperature in °C",
        "data": [32.5, 33.6, 31.5, 39.8, 41.4, 40.5, 39.0, 38.5]
      }
    ];

    $scope.chartConfig = {
      options: {
        chart: {
          type: 'spline'
        },
        plotOptions: {
          series: {
            stacking: ''
          }
        }
      },
      xAxis: {
          categories: ['2015-03-28 14:27:00', '2015-03-28 14:28:00', '2015-03-28 14:29:00', '2015-03-28 14:30:00', '2015-03-28 14:31:00', '2015-03-28 14:32:00', '2015-03-28 14:33:00', '2015-03-28 14:34:00']
      },
      series: $scope.chartSeries,
      title: {
        text: 'Analyte Measures'
      },
      credits: {
        enabled: true
      },
      loading: false,
      size: {}
    }
  }

})();
