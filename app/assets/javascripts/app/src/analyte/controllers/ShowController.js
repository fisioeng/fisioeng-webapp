(function() {
  'use strict';

  angular
    .module('Fisioeng')
    .controller('ShowAnalyteController', ShowAnalyteController);

  ShowAnalyteController.$inject = ['$scope'];

  function ShowAnalyteController($scope) {

    var categories = [],
        x;

    for (var i = 0; i <= 20; i++) {
      x = i;
      if ( i < 9)
        x = '0'+i;

      categories.push('2015-03-28 14:'+ x +':00');
    }

    $scope.axis = {};
    $scope.axis.y = {};
    $scope.axis.y.options = [
      {value: '°C', label: 'Temperature in °C'},
      {value: 'URA', label: 'Relative Humidity in %'},
      {value: 'B/m', label: 'Heart Frequency B/m'}
    ];



    var series =
    [
      [
        {
          "name": "Control",
          "data": getAleatory(24, 17, 49)
        },
        {
          "name": "Variation 1",
          "data": getAleatory(24, 17, 49)
        },
        {
          "name": "Variation 2",
          "data": getAleatory(24, 17, 49)
        }
      ],
      [
        {
          "name": "Control",
          "data": getAleatory(24, 10, 70)
        },
        {
          "name": "Variation 1",
          "data": getAleatory(24, 10, 70)
        }
      ],
      [
        {
          "name": "Control",
          "data": getAleatory(24, 50, 130)
        },
        {
          "name": "Variation 1",
          "data": getAleatory(24, 50, 130)
        }
      ]
    ];

    $scope.actualYAxis = 0;
    $scope.chartSeries = series[$scope.actualYAxis];

    updateGraph();

    $scope.changeYAxis = function (serie) {
      $scope.chartSeries = series[serie];
      updateGraph();
    };

    function updateGraph() {
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
            type: 'datetime',
            dateTimeLabelFormats: { // don't display the dummy year
                month: '%e. %b',
                year: '%b'
            },
            title: {
                text: 'Date and Time'
            }
        },
        yAxis: {
            title: {
                text: $scope.axis.y.options[$scope.actualYAxis].label
            }
        },
        tooltip: {
            headerFormat: '<b>{series.name}</b><br>',
            pointFormat: '{point.x:%e. %b}: {point.y:.2f}'
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
      };
    }

    function getAleatory ( amount, min, max ) {

      var data = [];
      for (var i = 1; i <= amount; i++ ) {
        data.push([ Date.UTC(2015, 4, 21, i, 0, 0), Math.floor((Math.random() * (max - min)) + min )]);
      }

      return data;
    }
  }

})();
