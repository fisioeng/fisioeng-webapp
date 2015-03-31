(function() {
  'use strict';

  angular
    .module('Fisioeng')
    .controller('ShowAnalyteController', ShowAnalyteController);

  ShowAnalyteController.$inject = ['$scope'];

  function ShowAnalyteController($scope) {
    $scope.chartSeries = [
      {
        "name": "Control in °C",
        "data": [32.5, 33.6, 31.5, 39.8, 41.4, 40.5, 39.0, 33.5]
      },
      {
        "name": "Variation 1 in °C",
        "data": [23.5, 27.6, 25.5, 19.8, 33.4, 30.5, 35.0, 29.5]
      },
      {
        "name": "Variation 2 in °C",
        "data": [25.5, 30.6, 21.5, 34.8, 28.4, 31.5, 35.0, 37.5]
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
